org 100h

mov al, 00h  ;get ready to set simple text mode
mov ah, 0
int 10h      ;set simple text mode

mov ah, 2    ;prepare to set cursor position
mov dh, 10   ;row 10
mov dl, 10   ;column 10
mov bh, 0    ;page 0
int 10h      ;set position


mov al, 'I'  ;prepare to write character 'I' on the interface
mov bh, 0    ;on page 0
mov bl, 5    ;5 is the color magenta
mov cx, 5    ;write the character 5 times
mov ah, 09h  ;get ready to write
int 10h      ;write 

ret




