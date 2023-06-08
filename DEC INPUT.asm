

DECIMAL_INPUT MACRO NUM
    PUSH AX
    PUSH BX 
    PUSH CX
       
    LOCAL L1
    LOCAL END_INPUT
    MOV AH, 1 
    MOV CL, 10
    
    
    L1: 
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_INPUT
        
        SUB AL, 30H
        MOV BL, AL
        MOV AX, NUM
        
        MUL CL
        
        MOV NUM, AX
        
        MOV BH, 0
        ADD NUM, BX
        
        JMP L1
    END_INPUT: 
    POP CX   
    POP BX
    POP AX           
            
    
ENDM





