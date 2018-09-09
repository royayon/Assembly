.MODEL SMALL
.STACK 100H
.DATA
 

.CODE

MAIN PROC
    MOV AL , 2
    MOV BL , 3
    
    ADD BL , AL  ; BL = BL + AL  
    ADD BL , 48  ; DECIMAL (0-9) --- ASCII (48-58)
    
    MOV AH , 2
    MOV DL , BL
    INT 21H
       
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




