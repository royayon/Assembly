.MODEL SMALL
.STACK 100H
.DATA

;MSG1 DB 0dh,0ah,'Enter A: $'
MSG1 DB 'Enter A: $'
MSG2 DB 'Enter B: $'
MSG3 DB 'Enter C: $'
MSG4 DB 'The value of D: $'

VAR1 DB 2
VAR2 DB 2
VAR3 DB 2 
VAR4 DB 2

.CODE
    MAIN PROC
        MOV AX , @DATA
        MOV DS , AX
        
        ;INPUT A
        MOV AH , 9
        LEA DX , MSG1
        INT 21H
        
        MOV AH , 1
        INT 21H
        MOV VAR1,AL
        
        MOV AH , 2
        MOV DL , 0AH
        INT 21H
        
        MOV AH , 2
        MOV DL , 0DH
        INT 21H 
        
        ;INPUT B 
        MOV AH , 9
        LEA DX , MSG2
        INT 21H
        
        MOV AH , 1
        INT 21H
        MOV VAR2,AL
        
        MOV AH , 2
        MOV DL , 0AH
        INT 21H
        
        MOV AH , 2
        MOV DL , 0DH
        INT 21H 
        
        
        ;INPUT C 
        MOV AH , 9
        LEA DX , MSG3
        INT 21H
        
        MOV AH , 1
        INT 21H
        MOV VAR3,AL
        
        MOV AH , 2
        MOV DL , 0AH
        INT 21H
        
        MOV AH , 2
        MOV DL , 0DH
        INT 21H 
        
        ;PROCESSING 
        MOV AH , 2
        MOV DL , 0AH
        INT 21H
        
        MOV AH , 2
        MOV DL , 0DH
        INT 21H
        
        MOV AH , 9
        LEA DX , MSG4
        INT 21H
        
        
        MOV BL , VAR2
        SUB BL , VAR3
        ADD BL , BL
        
        ADD VAR1 , BL
        MOV DL , VAR1 
        
        MOV AH , 2
        INT 21H        
        
    MOV AH , 4CH
    INT 21H
        
    MAIN ENDP
END MAIN
