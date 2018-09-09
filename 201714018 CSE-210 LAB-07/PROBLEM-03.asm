.MODEL SMALL
.STACK 100H
.DATA  
INPUT DB 'Please Enter the binary number: $'
OUTPUT DB 'The given number in Hexadecimal is: $'  
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
    
    ;Bin INPUT
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
    
    ;OUTPUT 
    MOV AH , 9
    LEA DX , NL
    INT 21H
    MOV AH , 9
    LEA DX , OUTPUT
    INT 21H
    
    ;HEXA OUTPUT 
    MOV CX , 4
    WHILE1:
        MOV DL , BH  
        SHR DL , 4
        
        CMP DL , 10
        JGE LETTER1
        ADD DL , 48
        JMP EXIT1
        LETTER1: 
        ADD DL , 55
        EXIT1:
        MOV AH , 2
        INT 21H 
        SHL BX , 4
     LOOP WHILE1
    
    
    
    MOV AH , 4CH
    INT 21H
    
MAIN ENDP
END MAIN
