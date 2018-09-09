.MODEL SMALL
.STACK 100H
.DATA


MSG1 DB 'Enter a letter in lowercase: $'
MSG2 DB 0DH,0AH,'The output is: $' 

.CODE
    MAIN PROC
        MOV AX , @DATA
        MOV DS , AX 
        
        ;INPUT
        MOV AH , 9
        LEA DX , MSG1
        INT 21H
          
        MOV AH , 1
        INT 21H 
        MOV BL , AL
        
        ;OUTPUT
        MOV AH , 9
        LEA DX , MSG2
        INT 21H 
        
        
        MOV AH , 2 
        SUB BL , 32
        MOV DL , BL
        INT 21H
        
        
        
        MOV AH , 4CH
        INT 21H
    MAIN ENDP
END MAIN