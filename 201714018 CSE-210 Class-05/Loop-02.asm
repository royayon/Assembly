.MODEL SMALL
.STACK 100H
.DATA
NL DB 0AH,0DH,'$'
.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    MOV AH , 1
    INT 21H
    
    MOV AH , 0
    MOV CX , AX
    SUB CX , 48
    
    ;LOOP
    TOP:
        MOV AH , 2
        MOV DL , 'A'
        INT 21H
        
        MOV AH , 9
        LEA DX , NL
        INT 21H 
        
        LOOP TOP
        
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN
