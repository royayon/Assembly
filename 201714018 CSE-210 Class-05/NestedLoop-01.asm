.MODEL SMALL
.STACK 100H
.DATA
NL DB 0AH,0DH,'$'
J DB ?
.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    ;INPUT 
    MOV AH , 1
    INT 21H
    
    ;SET CX
    MOV AH , 0
    MOV CX , AX
    SUB CX , 48
    
    ;A NEW LINE
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    ;NESTED LOOP
    MOV BL , 1
    OUTLOOP:
        MOV J , BL      ; j = i
        INLOOP:
            CMP J , 0    ;j>0
            JE EXIT1 
            MOV AH , 2
            MOV DL , '*'
            INT 21H 
            
            DEC J
            JMP INLOOP
            EXIT1:
            
            MOV AH , 9
            LEA DX , NL
            INT 21H 
            
            INC BL      ;j++
            
        LOOP OUTLOOP
        
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN
