include emu8086.inc
org 100h

lea dx, string

mov ah, 0ah   ;prepare the input
int 21h       ;read the string

mov bx, dx   ;bx is the string
mov ah, 0    ;ah is set to 0 so that we can print characters on the screen
mov al, ds:[bx+1]
add bx, ax          ;bx is the end of the string
mov byte ptr [bx+2], '$' ;adds a '$' at the end of the string 

lea bx, string   ;bx is the string
add bx, 2        ;the end of the string

countChars:
    
    cmp [bx], '$'   ;compare the current character with '$'
    je skip         ;if it is '$', exit loop
    inc count       ;increase count (counts how many characters there are)
    inc bx          ;goes to the next char
loop countChars 

skip:

mov ax, count     ;sets ax to count's value to print it
printn ''
print 'Your string has '
call print_num         ;prints ax 
print ' characters.'
ret

count dw 0
string db 62, 64 dup('?')
define_print_num
define_print_num_uns

