global readfile

section .data
SYS_EXIT equ 60
SYS_OPEN equ 2
SYS_CLOSE equ 3
SYS_LSEEK equ 8
SYS_MMAP equ 9
O_RDONLY equ 0
SEEK_END equ 2
PROT_READ equ 1
PROT_WRITE equ 2
MMAP_FLAGS equ PROT_READ | PROT_WRITE
MAP_PRIVATE equ 2

section .text

; readfile(filename)
; input:
;   filename -> rdi
; output:
;   addr -> rax
;   len -> rdx
readfile:
    push r12
    push rbx

    mov rax, SYS_OPEN
    mov rsi, O_RDONLY
    xor rdx, rdx
    syscall
    test rax, rax
    js .error_open
    mov r12, rax

    mov rax, SYS_LSEEK
    mov rdi, r12
    xor rsi, rsi
    mov rdx, SEEK_END
    syscall
    test rax, rax
    js .close_and_error
    mov rbx, rax
    je .empty

    mov rax, SYS_MMAP
    xor rdi, rdi
    mov rsi, rbx
    mov rdx, MMAP_FLAGS
    mov r10, MAP_PRIVATE
    mov r8, r12
    xor r9, r9
    syscall
    cmp rax, -1
    je .close_and_error
    mov r9, rax
    jmp .close_and_return

.empty:
    xor r9, r9
    xor rbx, rbx

.close_and_return:
    mov rax, SYS_CLOSE
    mov rdi, r12
    syscall
    mov rax, r9
    mov rdx, rbx
    pop rbx
    pop r12
    ret

.close_and_error:
    mov rax, SYS_CLOSE
    mov rdi, r12
    syscall

.error_open:
    mov rax, -1
    pop rbx
    pop r12
    ret
