.MODEL SMALL
.STACK 100H
.DATA 

.CODE

MAIN PROC
    MOV AH , 1   ; TAKING INPUT
    INT 21H
    
    MOV AH , 2     ; OUTPUT 
    MOV DL, AL
    INT 21H  
    
    
    
    
    
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




