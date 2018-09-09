.MODEL SMALL
.STACK 100H
.DATA
 

.CODE

MAIN PROC
    MOV AH , 1     ; TAKING INPUT
    INT 21H 
    
    MOV BL , AL
    
    MOV AH , 2     ; LINE FEED 
    MOV DL , 0AH
    INT 21H
    
    MOV AH , 2     ; CARRIAGE RETURN
    MOV DL , 0DH
    INT 21H
    
    MOV AH , 2     ; OUTPUT 
    MOV DL , BL
    INT 21H 
    
      
    
    
    
    
    
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




