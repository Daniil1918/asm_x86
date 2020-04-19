global main

extern fopen
extern fclose
extern fwrite
extern printf

section .data
    test_str db "Hello", 0x0a, 0x0
    path db "hello.txt", 0x0
    mode db "w", 0x0
    str_text db "Hello, World!", 0x0a, 0x0
    len_str equ $ -str_text

section .text
main:
    ;prolog
    push ebp
    mov ebp, esp

    ;open
    push mode
    push path
    call fopen

    ;validation of fp
    cmp eax, 0x0
    je error

    ;backup fp
    mov ebx, eax

    ;write
    push eax
    push len_str
    push 1
    push str_text
    call fwrite

    ;close
    push ebx
    call fclose
    mov ebx, 0x0

error:
    ;clear return value
    mov eax, 0x0

    ;end prolog
    mov esp, ebp
    pop ebp

    ret
