ORG 100H
.STACK 100

.DATA
F DB 10, 15, 20
V DB 1, 2, 3
TEN DB 10
RESULT DW 0

.CODE
MOV AX, @DATA
MOV DS, AX
XOR AX, AX

CALL POWER
RET

POWER PROC
    LEA SI, F
    LEA DI, V
    MOV BX, 0
    
    L1:
    MOV AL, [SI + BX]
    MOV CL, [DI + BX]
    
    MULTIPLY:
        MUL CL
    ADD RESULT, AX
    INC BL
    CMP BL, 3
    JL L1
    
    RETURNAL:
    CALL OUTPUT
    RET
POWER ENDP    
        
OUTPUT PROC
    MOV BX, RESULT
    
    OUT_LABEL:
    MOV AX, BX
    MOV CX, 0
    
    PUSH_REM:
    DIV TEN
    MOV DL, AH
    INC CX
    PUSH DX
    MOV AH, 0
    CMP AL, 0
    JNZ PUSH_REM
    
    POPNOUT:
    POP DX
    ADD DX, 30H
    MOV AH, 2
    INT 21H
    LOOP POPNOUT
    
    RETURN:
    RET
OUTPUT ENDP            