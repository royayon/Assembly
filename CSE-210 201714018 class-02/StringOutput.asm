.MODEL SMALL
.STACK 100H
.DATA 
NUM1 DB 2
NUM2 DB 3 
MSG DB 'This is a String$' ; Declarin a String


 

.CODE

MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    LEA DX , MSG       ; Load Effective Address
    MOV AH , 9
    INT 21H 
 
    
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




