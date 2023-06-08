

BINARY_INPUT MACRO NUM 
    LOCAL L1 
    LOCAL END_INPUT
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV AH, 1
    
    MOV CX, 16
            
    L1:
        INT 21H
        
        CMP AL, 0DH
        JE END_INPUT
        
        SUB AL, 30H
        
        SHL BX, 1
        
        OR BL, AL
        
        LOOP L1
        
        END_INPUT: 
        
    MOV NUM, BX
        
    POP CX
    POP BX
    POP AX
        
ENDM

