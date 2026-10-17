; alloc.asm
; Minimal mmap-based bump allocator for Vetri
; Target: x86-64 Linux, NASM
;
; Interface (Vetri register calling convention):
;   Input:  rdi = requested size in bytes
;   Output: rax = allocated address, or 0 on failure
;
; Properties:
;   - 8-byte alignment
;   - Lazy initialization
;   - Minimum mapping size: 64 KiB
;   - New mappings are added as needed
;   - No free(), no reuse, not thread-safe

default rel

section .bss
align 8
heap_next: resq 1
heap_end:  resq 1

section .text
global vetri_alloc:function

vetri_alloc:
    ; Reject zero-sized allocations.
    test rdi, rdi
    jz .fail

    ; Align requested size up to 8 bytes.
    add rdi, 7
    jc .fail
    and rdi, -8

    ; Try the current arena.
    mov rax, [heap_next]
    mov rdx, rax
    add rdx, rdi
    jc .map_new

    cmp rdx, [heap_end]
    ja .map_new

    ; Fast path: enough space remains.
    mov [heap_next], rdx
    ret

.map_new:
    ; Preserve the aligned requested size.
    push rdi

    ; Mapping size = max(requested size, 64 KiB).
    mov rsi, rdi
    cmp rsi, 65536
    jae .round_pages

    mov esi, 65536

.round_pages:
    ; Round mapping size up to a 4096-byte page boundary.
    add rsi, 4095
    jc .map_failed
    and rsi, -4096

    ; mmap(NULL, length, PROT_READ | PROT_WRITE,
    ;      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0)
    xor edi, edi
    mov edx, 3              ; PROT_READ | PROT_WRITE
    mov r10d, 0x22          ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1               ; fd
    xor r9d, r9d             ; offset
    mov eax, 9               ; __NR_mmap on x86-64 Linux
    syscall

    ; Raw Linux syscalls return -errno on failure.
    cmp rax, -4095
    jae .map_failed

    ; Save the mapping base.
    mov r9, rax

    ; Record the end of this mapping.
    lea rdx, [r9 + rsi]
    mov [heap_end], rdx

    ; Set the next allocation position.
    pop rdi
    lea rax, [r9 + rdi]
    mov [heap_next], rax

    ; Return the base of the allocated object.
    mov rax, r9
    ret

.map_failed:
    ; Restore the saved request size.
    pop rdi

.fail:
    xor eax, eax
    ret
