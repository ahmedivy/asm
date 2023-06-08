

HEXA_INPUT MACRO NUM 
    LOCAL L1
    LOCAL END_INPUT
    LOCAL LETTER_  
    LOCAL L2
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV AH, 1

    
    MOV CX, 4     
    
    L1: 
        
        INT 21H 
        
        CMP AL, 0DH
        JE END_INPUT
        
        CMP AL, 41H
        JGE LETTER_
        
        SUB AL, 30H
        JMP L2
        
        LETTER_:
        SUB AL, 37H
        
        L2:
        SHL BX, 4
        
        OR BL, AL
        
        LOOP L1
        
     END_INPUT:  
        
        
     MOV NUM, BX 
     
     POP AX
     POP BX
     POP CX
     
     
ENDM





