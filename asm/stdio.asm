global nl
global printi
global prints
global printc
global errnl
global erri
global errs
global errc

section .data
SYS_WRITE equ 1
LF equ 10
STDIN equ 0
STDOUT equ 1
STDERR equ 2

section .bss
buf resb 32

section .text

; newline
nl:
    push LF
    mov rsi, rsp
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rdx, 1
    syscall
    pop rdi
    ret

; printi(x)
; x -> rdi
printi:
    mov rax, rdi
    test rdi, rdi
    jns .printi_non_neg
    neg rax
.printi_non_neg:
    lea rsi, [rel buf + 19]
    mov rcx, 10
.printi_loop:
    xor rdx, rdx
    div rcx
    add dl, '0'
    mov [rsi], dl
    dec rsi
    test rax, rax
    jnz .printi_loop

    mov rax, 1
    test rdi, rdi
    jns .printi_no_sign
    mov byte [rsi], '-'
    dec rsi
.printi_no_sign:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    inc rsi
    lea rdx, [rel buf + 20]
    sub rdx, rsi
    syscall
    
    mov rax, rdx
    ret

; prints(s)
; s -> rdi
prints:
    xor rax, rax
    mov rcx, -1
    mov rsi, rdi
    cld
    repne scasb
    sub rdi, rsi
    lea rax, [rdi - 1]

    mov rdx, rax
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    syscall
    
    mov rax, rdx
    ret

; printc(c)
; c -> rdi
printc:
    push rdi
    mov rsi, rsp
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rdx, 1
    syscall
    pop rdi
    ret

; errnl
errnl:
    push LF
    mov rsi, rsp
    mov rax, SYS_WRITE
    mov rdi, STDERR
    mov rdx, 1
    syscall
    pop rdi
    ret

; erri(x)
; x -> rdi
erri:
    mov rax, rdi
    test rdi, rdi
    jns .erri_non_neg
    neg rax
.erri_non_neg:
    lea rsi, [rel buf + 19]
    mov rcx, 10
.erri_loop:
    xor rdx, rdx
    div rcx
    add dl, '0'
    mov [rsi], dl
    dec rsi
    test rax, rax
    jnz .erri_loop

    mov rax, 1
    test rdi, rdi
    jns .erri_no_sign
    mov byte [rsi], '-'
    dec rsi
.erri_no_sign:
    mov rax, SYS_WRITE
    mov rdi, STDERR
    inc rsi
    lea rdx, [rel buf + 20]
    sub rdx, rsi
    syscall
    
    mov rax, rdx
    ret

; errs(s)
; s -> rdi
errs:
    xor rax, rax
    mov rcx, -1
    mov rsi, rdi
    cld
    repne scasb
    sub rdi, rsi
    lea rax, [rdi - 1]

    mov rdx, rax
    mov rax, SYS_WRITE
    mov rdi, STDERR
    syscall
    
    mov rax, rdx
    ret

; errc(c)
; c -> rdi
errc:
    push rdi
    mov rsi, rsp
    mov rax, SYS_WRITE
    mov rdi, STDERR
    mov rdx, 1
    syscall
    pop rdi
    ret
