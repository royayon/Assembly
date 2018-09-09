.MODEL SMALL
.STACK 100H
.DATA    
INPUT DB 'Input: $'
OUTPUT DB 'Output: $' 
NL DB 0AH,0DH,'$'  
VAR1 DB ?  
VAR2 DB ? 
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
           
    MOV AH , 1
    INT 21H
    MOV VAR2 , AL 
    
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    MOV AH , 9
    LEA DX , OUTPUT
    INT 21H  
    
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    SUB VAR2 , 48 
    MOV CH , 0
    MOV CL , VAR2
    MOV BL , 1
    
    TOP:  
        MOV  VAR1 , 1
        MOV AH , 2
        MOV DL , '('
        INT 21H 
        MOV COUNT , 1
        WHILE:
            CMP COUNT , BL
            JG END_WHILE
            
            ADD VAR1 , 48
            MOV AH , 2
            MOV DL , VAR1
            INT 21H 
            SUB VAR1 , 48 
            
            CMP COUNT , BL
            JE END_WHILE
            MOV AH , 2
            MOV DL , '+'
            INT 21H 
            
            ADD VAR1 , 1 
            ADD COUNT , 1
            
        JMP WHILE
        END_WHILE:
        MOV AH , 2
        MOV DL , ')'
        INT 21H 
        
        CMP BL , VAR2
        JE EXIT
        MOV AH , 2
        MOV DL , '+'
        INT 21H
        
        
        ADD BL , 1
    LOOP TOP
    EXIT:
    
           
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN