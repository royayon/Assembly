.MODEL SMALL
.STACK 100H
.DATA  
INPUT DB 'First Number: $'
OUTPUT DB 'Second Number: $' 
OUTPUT1 DB 'Number of one: $'
OUTPUT2 DB 'Summation: $'  
NL DB 0AH,0DH,'$'
VAR1 DB ?
COUNT DB ? 
.CODE
MAIN PROC 
    MOV AX , @DATA
    MOV DS , AX
    
    MOV AH , 9
    LEA DX , INPUT
    INT 21H
    
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    ;FIRST BIN  INPUT
    AND BX , 0
    MOV AH , 1
    INT 21H
    WHILE:
        CMP AL , 0DH
        JE END_WHILE
        
        MOV AH , 0
        SUB AL , 48
        SHL BX , 1
        OR BX , AX
        
        MOV AH , 1
        INT 21H
        
        
    JMP WHILE
    END_WHILE:   
    
    
    MOV AH , 9
    LEA DX , NL
    INT 21H 
    
    MOV AH , 9
    LEA DX , OUTPUT
    INT 21H 
    
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    
    ;SECOND BIN  INPUT
    AND CX , 0
    MOV AH , 1
    INT 21H
    WHILE1:
        CMP AL , 0DH
        JE END_WHILE1
        
        MOV AH , 0
        SUB AL , 48
        SHL CX , 1
        OR CX , AX
        
        MOV AH , 1
        INT 21H
        
        
    JMP WHILE1
    END_WHILE1: 
    
    
    MOV AH , 9
    LEA DX , NL
    INT 21H 
    ADD BX,CX  
    
    MOV COUNT , 0
    ;OUTPUT2
    MOV AH , 9
    LEA DX , OUTPUT2 
    INT 21H
    MOV CX , 16
    TOP:
        ROL BX , 1
        JC ONE 
        
        MOV AH , 2
        MOV DL , 48
        INT 21H
        JMP EXIT
        ONE: 
        ADD COUNT , 1
        MOV AH , 2
        MOV DL , 49
        INT 21H
        EXIT: 
    LOOP TOP 
    
    MOV AH , 9
    LEA DX , NL 
    INT 21H
    MOV AH , 9
    LEA DX , OUTPUT1 
    INT 21H
    
    ADD COUNT , 48
    MOV AH , 2
    MOV DL , COUNT 
    INT 21H
    
    MOV AH , 4CH
    INT 21H
    
MAIN ENDP
END MAIN
