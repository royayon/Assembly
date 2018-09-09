.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH,'Input: $'
MSG2 DB 0AH,0DH,'Even!! $'
MSG3 DB 0AH,0DH,'Odd! $'

.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    BEGIN:
    MOV AH , 9
    LEA DX , MSG1
    INT 21H
    
    MOV AH , 1
    INT 21H
    
    ;MOV AX , AL
    MOV BX , 2
    
    DIV BX            ;DIVITION IS IN AX
                      ;MOD IS IN DX
    CMP DX , 0
    JE LEVEL
        MOV AH , 9
        LEA DX , MSG3
        INT 21H
    JMP EXIT
        LEVEL:
        MOV AH , 9
        LEA DX , MSG2
        INT 21H
    EXIT: 
    JMP BEGIN   
    
    
    
MOV AH , 4CH
INT 21H
MAIN ENDP
END MAIN