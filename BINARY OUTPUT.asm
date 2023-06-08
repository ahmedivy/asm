

BINARY_OUTPUT MACRO NUM
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    
     
    
    LOCAL L1 
    LOCAL CONTINUE
    
    MOV BX, NUM
    
    MOV CX, 16
    
    MOV AH, 2
    
    L1:
    
        RCL BX, 1
        
        JC PRINT_1
        
        MOV DL, 30H
        INT 21H  
        
        JMP CONTINUE
        
        PRINT_1:
        MOV DL, 31H
        INT 21H             
        
        CONTINUE:
        LOOP L1 
        
    POP DX
    POP CX
    POP BX
    POP AX
                 
                 
ENDM