global streq
global strcmp
global strlen
global strcpy

section .text

; streq(s1, s2)
; s1 -> rdi
; s2 -> rsi
streq:
.streq_loop:
    mov al, byte [rdi]
    mov dl, byte [rsi]

    cmp al, dl
    jne .streq_not_equal

    test al, al
    jz .streq_equal

    inc rdi
    inc rsi
    jmp .streq_loop

.streq_equal:
    mov rax, 1
    ret

.streq_not_equal:
    xor rax, rax
    ret

; strcmp(s1, s2)
; input:
;   s1 -> rdi
;   s2 -> rsi
; output:
;   -1/0/1 -> rax
strcmp:
.strcmp_loop:
    mov al, byte [rdi]
    mov dl, byte [rsi]

    cmp al, dl
    jne .strcmp_not_equal

    test al, al
    jz .strcmp_equal

    inc rdi
    inc rsi
    jmp .strcmp_loop

.strcmp_equal:
    xor rax, rax
    ret

.strcmp_not_equal:
    jb .strcmp_less
    mov rax, 1
    ret

.strcmp_less:
    mov rax, -1
    ret

; strlen(s)
; s -> rdi
strlen:
    xor rax, rax
    mov rcx, -1
    mov rsi, rdi
    cld
    repne scasb
    sub rdi, rsi
    lea rax, [rdi - 1]
    ret
