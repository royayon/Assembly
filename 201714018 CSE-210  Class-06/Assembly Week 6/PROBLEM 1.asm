.MODEL SMALL
.STACK 100H
.DATA
J DB ?
K DB ?
M DB ?
N DB ?
O DB ?
.CODE
MAIN PROC    
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    MOV AH,0
    MOV BL,49
    MOV CX,AX
    SUB CX,48
    
    ;SUB AL,80
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    
    MOV M,49
    
  LINEPRINT:
    MOV J,49
    MOV K,BH
    
    SPACE:
    CMP K,AL
    JG EXIT1
    MOV AH,2
    MOV DL,' '
    INT 21H
    INC K    
    JMP SPACE
    EXIT1:
     
    MOV DH,M
    MOV N,DH
    NUMPRINT:
      CMP J,BL
      JG EXIT2
      CMP DH,BL
      JLE L1
      DEC N
      MOV AH,2
      MOV DL,N
      INT 21H            
      JMP LE
      L1:
      MOV AH,2
      MOV DL,DH
      INT 21H
      MOV N,DH
      LE:
      INC DH
      INC J
      JMP NUMPRINT
    EXIT2:
    ADD BL,2
    ADD BH,1
    ADD M,1
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    LOOP LINEPRINT
    

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN