.MODEL SMALL
.STACK 100H
.DATA 
INPUT DB 0AH,0DH,'Input a Character to check: $'
UPPER DB 0AH,0DH,'Upper Case! $'
LOWER DB 0AH,0DH,'Lower Case! $'   
ERROR DB 0AH,0DH,'Its not a Character! $'

.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX 
    
    BEGIN:
    MOV AH , 9
    LEA DX , INPUT
    INT 21H   
    
    MOV AH , 1
    INT 21H
    MOV BL , AL          ;INPUT IS IN BL
    
    CMP BL , 65
    JL ELSE
    CMP BL , 90
    JG ELSE
        MOV AH , 9
        LEA DX , UPPER
        INT 21H 
    JMP END
    
    ELSE:
        CMP BL , 97 
        JL ELSE1
        CMP BL , 122
        JG ELSE1
            MOV AH , 9
            LEA DX , LOWER
            INT 21H   
        JMP END 
        ELSE1:
            MOV AH , 9
            LEA DX , ERROR
            INT 21H 
        
    END:  
    JMP BEGIN
      
    
MOV AH , 4CH
INT 21H
MAIN ENDP
END MAIN