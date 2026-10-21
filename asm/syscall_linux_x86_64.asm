default rel
section .text

global sys_read:function
sys_read:
    mov eax, 0
    syscall
    ret

global sys_write:function
sys_write:
    mov eax, 1
    syscall
    ret

global sys_openat:function
sys_open:
    mov eax, 1
    syscall
    ret

global sys_openat:function
sys_openat:
    mov r10, rcx
    mov eax, 257
    syscall
    ret

global sys_mmap:function
sys_mmap:
    mov r10, rcx
    mov eax, 9
    syscall
    ret

global sys_munmap:function
sys_munmap:
    mov eax, 11
    syscall
    ret
