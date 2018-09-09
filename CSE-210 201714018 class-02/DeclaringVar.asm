.MODEL SMALL
.STACK 100H
.DATA 
NUM1 DB 2
NUM2 DB 3

 

.CODE

MAIN PROC 
    MOV AX , @DATA    ; LOADING DATA SEGMAENT INTO DS REGISTER
    MOV DS , AX
    
    MOV CL , NUM1
    MOV BL , NUM2
    
    ADD BL , CL
    ADD BL , 48
    
     
    
    MOV DL , BL
    MOV AH , 2
    INT 21H
    
     
   
    
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




