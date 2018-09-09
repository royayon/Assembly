.MODEL SMALL
.STACK 100H
.DATA
NL DB 0AH,0DH,'$'
J DW ?
.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    ;INPUT 
    MOV AH , 1
    INT 21H
    
    ;SET CX
    MOV AH , 0
    MOV CX , AX 
    SUB CX , 48 
    MOV J , CX
    
    ;A NEW LINE
    MOV AH , 9
    LEA DX , NL
    INT 21H
    
    ;NESTED LOOP WITHOUT CMP
    MOV BX , 1
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
            
            INC BX      ;j++
             
        MOV CX , J
        DEC J
        LOOP OUTLOOP
        
    MOV AH , 4CH
    INT 21H
MAIN ENDP
END MAIN
