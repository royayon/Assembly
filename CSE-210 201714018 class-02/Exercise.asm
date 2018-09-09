.MODEL SMALL
.STACK 100H
.DATA 
NUM1 DB 2
NUM2 DB 3 
MSG1 DB 'Input 1 : $' ; Declarin a String 
MSG2 DB 'Input 2 : $' 
MSG3 DB 'Output : $'


 

.CODE

MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    ;INPUT 1
    MOV AH , 9
    LEA DX , MSG1
    INT 21H 
    
    MOV AH , 1
    INT 21H
    MOV NUM1 , AL
    
    MOV AH , 2
    MOV DL , 0AH      ; LINE FEED
    INT 21H  
    
    MOV AH , 2
    MOV DL , 0DH      ; CARRIAGE RETURN
    INT 21H 
    
    ;INPUT 2
    MOV AH , 9
    LEA DX , MSG2
    INT 21H 
    
    MOV AH , 1
    INT 21H
    MOV NUM2 , AL  
    
    MOV AH , 2
    MOV DL , 0AH      ; LINE FEED
    INT 21H  
    
    MOV AH , 2
    MOV DL , 0DH      ; CARRIAGE RETURN
    INT 21H 
    
    ;OUTPUT
    MOV AH , 9
    LEA DX , MSG3
    INT 21H
    
    MOV AL , NUM1
    ADD AL , NUM2
    SUB AL , 48
    
    
    MOV AH , 2
    MOV DL , AL
    INT 21H
      
MOV AH, 4CH      ; Return to OS
INT 21H 
   
MAIN ENDP


END MAIN




