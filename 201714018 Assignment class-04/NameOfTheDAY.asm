.MODEL SMALL
.STACK 100H
.DATA   
INPUT DB 0AH,0DH,'Enter the number: $' 
OUTPUT DB 0AH,0DH,'Name of the day: $'
;DAYS DB 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'
SUNDAY DB 'Sunday $'
MONDAY DB 'Monday $'
TUESDAY DB 'Tuesday $'
WEDNESDAY DB 'Wednesday $'
THURSDAY DB 'Thursday $'
FRIDAY DB 'Friday $'
SATURDAY DB 'Saturday $'
.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX  
    
    BEGIN:
    MOV AH , 9
    LEA DX , INPUT
    INT 21H
    
    MOV AH , 1
    INT 21H 
    MOV BL , AL
    SUB BL , 48   ; INPUT IS IN ASCII
    
    MOV AH , 9
    LEA DX , OUTPUT
    INT 21H
    
    CMP BL , 1
    JE LEVEL1 
    JMP BLOCK1
        LEVEL1:
        MOV AH , 9
        LEA DX , SUNDAY
        INT 21H
        JMP EXIT 
    BLOCK1:
    CMP BL , 2
    JE LEVEL2 
    JMP BLOCK2
        LEVEL2:
        MOV AH , 9
        LEA DX , MONDAY
        INT 21H
        JMP EXIT 
    BLOCK2:
    CMP BL , 3
    JE LEVEL3
    JMP BLOCK3
        LEVEL3:
        MOV AH , 9
        LEA DX , TUESDAY
        INT 21H
        JMP EXIT 
    BLOCK3:
    CMP BL , 4
    JE LEVEL4
    JMP BLOCK4
        LEVEL4:
        MOV AH , 9
        LEA DX , WEDNESDAY
        INT 21H
        JMP EXIT
    BLOCK4:
    CMP BL , 5
    JE LEVEL5
    JMP BLOCK5
        LEVEL5:
        MOV AH , 9
        LEA DX , THURSDAY
        INT 21H
        JMP EXIT  
    BLOCK5:
    CMP BL , 6
    JE LEVEL6
    JMP BLOCK6
        LEVEL6:
        MOV AH , 9
        LEA DX , FRIDAY
        INT 21H
        JMP EXIT 
    BLOCK6:
    CMP BL , 7
    JE LEVEL7
    JMP BLOCK7
        LEVEL7:
        MOV AH , 9
        LEA DX , SATURDAY
        INT 21H
        JMP EXIT 
    BLOCK7:
    EXIT: 
    JMP BEGIN
    
    
    
MOV AH , 4CH
INT 21H    
MAIN ENDP
END MAIN