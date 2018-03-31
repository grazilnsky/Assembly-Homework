

org 100h

lea dx, string

mov ah, 0ah     ;prepares the input
int 21h         ;makes it so that we cannot read more than 22 characters, as specified in the second byte of the string's initialization

mov bx, dx
mov ah, 0          ;prepare ah for printing
mov al, ds:[bx+1]
add bx, ax          ;bx is the end of the string
mov byte ptr [bx+2], '$' ;adds a dollar sign at the end of the string
lea dx, new_line         ;goes to the next line
mov ah, 09h         ;prepares to write a new line
int 21h             ;write new line
lea dx, string+2    ;moves the string into dx
mov ah, 09h         ;prepares to write the string
int 21h             ;write the string
ret



string db 20, 22 dup('?')

new_line db 0Dh,0Ah, '$'
