ORG 100H

.DATA
CELSIUS DB 35
F DB 0
MULT DW 0
QUOTIENT DB 0
NINE DB 9
FIVE DB 5
TEN DB 10

.CODE
MOV AX, @DATA
MOV DS, AX
XOR AX, AX

C_TO_F MACRO C_TEMP
    MUL_N C_TEMP, NINE
    MOV BX, MULT
    DIV_N BX, FIVE
    MOV AL, QUOTIENT
    ADD AL, 32
    MOV F, AL    
ENDM

MUL_N MACRO NUM1, NUM2
    PUSH AX
    MOV AL, NUM1
    MUL NUM2
    MOV MULT, AX
    POP AX
ENDM

DIV_N MACRO NUM1, NUM2
    PUSH AX
    MOV AX, NUM1
    DIV NUM2
    MOV QUOTIENT, AL
    POP AX
ENDM

MAIN PROC
    C_TO_F CELSIUS 
    CALL DECOUT
    RET
MAIN ENDP

DECOUT PROC
    PUSH AX
    PUSH DX
    XOR BX, BX
    XOR AX, AX
    
    MOV BL, F
    
    OUTPUTL:
        MOV AL, BL
        MOV CX, 0
        
        PUSH_REM:
            DIV TEN
            MOV DL, AH
            PUSH DX
            MOV AH, 0
            INC CX
            CMP AL, 0
            JNZ PUSH_REM
            
        POPNOUT:
            POP DX
            ADD DX, 30H
            MOV AH, 2
            INT 21H
            LOOP POPNOUT
            
        RETURNL:
            RET
DECOUT ENDP                    