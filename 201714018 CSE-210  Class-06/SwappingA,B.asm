.MODEL SMALL
.STACK 100H
.DATA
INPUTA DB 'Enter A: $'
INPUTb DB 'Enter B: $'

OUTPUTA DB 'After swapping A: $'
OUTPUTB DB 'After swapping B: $'
NL DB 0AH,0DH,'$'
A DB ?
B DB ? 

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
    MOV A , AL 
    ;NL
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    ;INPUT B
    MOV AH , 9
    LEA DX , INPUTB
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV B , AL 
    
    ;NL
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    
    ;SWAPPING
    MOV BL , A 
    MOV CL , B
    MOV A , CL
    MOV B , BL
    
    ;OUTPUT A 
    MOV AH , 9
    LEA DX , OUTPUTA
    INT 21H 
    
    MOV AH , 2
    MOV DL , A
    INT 21H  
    
    ;NL
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    ;OUTPUT B 
    MOV AH , 9
    LEA DX , OUTPUTB
    INT 21H 
    
    MOV AH , 2
    MOV DL , B
    INT 21H 
    
    ;NL
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    
    
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN




