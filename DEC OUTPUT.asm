

DECIMAL_OUTPUT MACRO NUM
    PUSH AX
    PUSH BX
    PUSH CX
    LOCAL L1
    LOCAL L2
    
    MOV AX, NUM
    
    MOV BL, 10
    MOV CH, 0
    MOV BH, 0
    
    L1:
        DIV BL
        MOV CL, AH
        
        PUSH CX
        INC BH  
        
        MOV AH, 0
        CMP AL, 0
        JNE L1 
        
        
    MOV AH, 2
    L2:
        POP CX
        MOV DL, CL
        ADD DL, 30H
        INT 21H
        DEC BH
        
        CMP BH, 0
        JNE L2    
        
    POP CX    
    POP BX
    POP AX
    
ENDM





