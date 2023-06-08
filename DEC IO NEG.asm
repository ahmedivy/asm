indec proc
    
    xor dx, dx
    mov ah, 1
    int 21H
    cmp al, 2dh
    je setsign
    
    
    cmp al, 0DH
    je end_input

    sub al, 30H
    mov dl, al

    mov ax, bx
    mul constant
    add ax, dx
    mov bx, ax 

    jmp indec
end_input:
    mov dl, 0Ah
    mov ah, 2
    int 21h
    
    ; checking sign
    cmp sign, 1
    je take_comp
    RET
    
setsign:
    mov sign, 1
    jmp indec

take_comp:
    neg bx
    mov sign, 0
    ret
indec endp


outdec proc
    cmp bx, 0
    jl print_neg
end_print_neg:
    mov cx, 0
    mov ax, bx
    mov bl, 10
quotient_loop:
    div bl
    mov dl, AH
    push dx
    inc cx
    cmp al, 0
    mov ah, 0
    jne quotient_loop
    mov ah, 2

poploop:
    pop dx
    add dl, 30H
    int 21H
    loop poploop

    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h

    ret
outdec endp

print_neg:
    mov ah, 2
    mov dl, 2Dh
    int 21H
    neg bx
    jmp end_print_neg

         