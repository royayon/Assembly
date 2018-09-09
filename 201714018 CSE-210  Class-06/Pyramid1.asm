.MODEL SMALL
.STACK 100H
.DATA
INPUT DB 'Enter N: $'
NL DB 0AH,0DH,'$' 
J DW ?  
I DW ?
.CODE   
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    ;INPUT
    MOV AH , 9
    LEA DX , INPUT
    INT 21H 
    
    MOV AH , 1
    INT 21H
    
    ;SETTING CX
    MOV AH , 0
    MOV CX , AX
    SUB CX , 48 
    MOV I , CX
    MOV J , CX
    
    ;A NEW LINE
    MOV AH , 9
    LEA DX , NL
    INT 21H 
    
    ;NESTED LOOP 
    DEC I
    MOV CX , I
    MOV BX , CX
    OUTLOOP:
        MOV CX , BX
        INLOOP:  
            MOV AH , 2
            MOV DL , '*'
            INT 21H 
            LOOP INLOOP
            
            MOV AH , 9
            LEA DX , NL
            INT 21H 
            
            DEC BX      
             
        MOV CX , J
        DEC J
        LOOP OUTLOOP
    
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN




