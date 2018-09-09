.MODEL SMALL
.STACK 100H
.DATA
.CODE   
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    ;CLEAR BX
    AND BX , 0
    ;INPUT CHAR
    MOV AH , 1
    INT 21H
    
    ;BINARY INPUT
    WHILE:
        CMP AL , 0DH
        JE EXIT
        SUB AL , 48
        SHL BX , 1 
        MOV AH , 0
        OR BX , AX
        
        MOV AH , 1
        INT 21H 
        JMP WHILE
        EXIT: 
        
        ;NEWLINE
        MOV AH , 2
        MOV DL , 0DH
        INT 21H
                 
        MOV AH , 2
        MOV DL , 0AH
        INT 21H
     ;BINARY OUTPUT
     MOV CX , 16
     TOP:
         ROL BX , 1
         JC ONE 
         MOV AH , 2
         MOV DL , '0'
         INT 21H 
         JMP EXIT1
         ONE:
         MOV AH , 2
         MOV DL , '1'
         INT 21H
         EXIT1:
         LOOP TOP
         
             
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN