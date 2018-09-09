.model small
.stack 100h
.data
a db ?
b db ?
.code 

main proc
      
      mov ah,1
      int 21h
      mov a,al
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV AH,2
      MOV DL,0DH
      INT 21H
      
      mov ah,1
      int 21h
      mov b,al
      
      mov cl,a
      mov ch,b
      mov b,cl
      mov a,ch
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV AH,2
      MOV DL,0DH
      INT 21H
      
      mov ah,2
      mov dl,a
      int 21h
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV AH,2
      MOV DL,0DH
      INT 21H 
      
      mov ah,2
      mov dl,b
      int 21h 
      