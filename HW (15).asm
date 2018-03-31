org 100h
 

mov al, 13h   ;13h graphic EGA graphics 

mov ah, 0   ;prepare int 10h for setting the right graphic mode     
int 10h       ;call interrupt 10h     

mov cx, dim    ;set the nr of repetitions
mov bx, col    ;bx is the current column 
mov al, 15   ;set color to white
mov dx, line   ;set line to line
mov ah, 0ch ;prepare to draw the pixel
lineHor:  
    push cx      ;save cx on a stack    
    mov cx, bx   ;set column to col  
    int 10h      ;draw pixel
    
     
    inc bx       ;get to next column
    pop cx       ;restore cx
loop lineHor
 
mov cx, dim
          
lineOblic:
    push cx       ;save cx on a stack    
    mov cx, dx    ;column increases so that we get an oblic line
    int 10h       ;draw pixel
    inc dx        ;column increases
    pop cx        ;restore cx
loop lineOblic 

mov dx, line      ;set the line to line
mov bx, col       ;set current column to col
mov cx, dim       ;set the dimension of the next line

lineVert:
    mov si, cx   ;save cx on si
    mov cx, bx
 
    add cx, dim  ;go to the next line
    int 10h      ;write the pixel
    sub cx, dim  ;restore the initial line
    
    inc dx
    mov cx, si   ;restori si
loop lineVert


ret

dim dw 50
line dw 100
col dw 100

