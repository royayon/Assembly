.MODEL SMALL
.STACK 100H
.DATA
INPUTA DB 0AH,0DH,'Enter A: $'
INPUTB DB 0AH,0DH,'Enter B: $'
INPUTC DB 0AH,0DH,'Enter + OR -: $'
OUTPUT DB 0AH,0DH,'X = $' 
VAR1 DB 0
VAR2 DB 0
VAR3 DB 0
.CODE   
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX 
    
    ;INPUT A
    MOV AH , 9
    LEA DX , INPUTA
    INT 21H
    
    MOV AH , 1
    INT 21H
    
    MOV VAR1 , AL
    SUB VAR1 , 48
    
    ;INPUT B
    MOV AH , 9
    LEA DX , INPUTB
    INT 21H
    
    MOV AH , 1
    INT 21H
    
    MOV VAR2 , AL
    SUB VAR2 , 48
    
    ;INPUT C
    MOV AH , 9
    LEA DX , INPUTC
    INT 21H
    
    MOV AH , 1
    INT 21H
    
    MOV VAR3 , AL 
    
    MOV AH , 9
    LEA DX , OUTPUT
    INT 21H
    ;CALCULATOR
    CMP VAR3 , 43
    JNE ELSE
        MOV BL , VAR2
        ADD VAR1 , BL
        MOV DL , VAR1
        ADD DL , 48
        JMP BREAK
    ELSE:
        MOV BL , VAR2
        SUB VAR1 , BL
        CMP VAR1 , 0
        JGE ELSE1
        JL ELSE2
        ELSE2:
            NEG VAR1
        ELSE1:
        MOV DL , VAR1
        ADD DL , 48
        JMP BREAK
    
     
    BREAK:
    MOV AH , 2
    INT 21H
    
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN