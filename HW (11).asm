include 'emu8086.inc'

org 100h

lea dx, string

mov ah, 0ah     ;prepares the input
int 21h         ;read the string

mov bx, dx
mov ah, 0           ;prepare ah for printing
mov al, ds:[bx+1]
add bx, ax          ;bx is the end of the string
mov byte ptr [bx+2], '$' ;adds a dollar sign at the end of the string
printn ''           ;new line
lea dx, string+2    ;moves the string into dx
mov ah, 09h         ;prepares to write the string
int 21h             ;write the string

          
ret



string db 60, 64 dup('?')





