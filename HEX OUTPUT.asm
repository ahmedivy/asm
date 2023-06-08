

HEXA_OUTPUT MACRO NUM
    LOCAL PRINT
    LOCAL LETTER_
    LOCAL END_PRINT
    PUSH AX
    PUSH BX    
    PUSH DX 
    PUSH CX 
    
    MOV BX, NUM
    
    MOV CX, 4
    MOV AH, 2H 
    
    MOV DL, 0AH
    INT 21H 
    
    MOV DL, 0DH
    INT 21H
    
    PRINT:
        MOV DL, BH
        SHR DL, 4
        SHL BX, 4
        
        CMP DL, 0AH
        JGE LETTER_
        
        ADD DL, 30H
        INT 21H
        JMP END_PRINT
        
        LETTER_:
        ADD DL, 37H
        INT 21H
        
        
        END_PRINT:
        LOOP PRINT  
    
    POP CX
    POP DX
    POP BX
    POP AX
    
    
    
ENDM

