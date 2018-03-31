

org 100h

mov al, 00h  ;simple text mode
mov ah, 0
int 10h

mov dl, col
mov dh, line
mov bh, 0
mov ah, 02h ;prepare to set cursor position
int 10h

mov al, 'O'
mov bh, 0     ; page nr
mov bl, 4  ;color red
mov cx, 1 ;numbver of times it will draw a character 
mov ah, 09h ;prepare int 10h to write character
int 10h  



readKey:
    mov ah, 00h ;prepare to read key
    int 16h ;read key 
    cmp al, 'a' ;compare the input from the keyboard with 'a'
    jne next    ;if it is not 'a', go to the next comparison
    
    dec dl      ;decrease the horizontal coordinate in the graphic interface
    mov ah, 02h ;prepare to set cursor position
    int 10h     
    
    mov al, 'O'   ;moves 'O' to al
    mov ah, 09h   ;prepares to write 'O'
    int 10h       
    
    
next:
    cmp al, 's'   ;compare input with 's'
    jne next2     ;if it is not 's', go to the next comparison
    
    inc dh        ;increases the vertical coordinate in the graphic interface
    mov ah, 02h
    int 10h
    mov al, 'O'
    mov ah, 09h
    int 10h
next2:
     cmp al, 'd'  ;compare input with 'd'
    jne next3     ;if it is not 'd', go to the next comparison
    
    inc dl        ;increases the horizontal coordinate in the graphic interface
    mov ah, 02h
    int 10h
    mov al, 'O'
    mov ah, 09h
    int 10h
next3:
     cmp al, 'w'  ;compare the input with 'w'
    jne none      ;if it is not 'w', do nothing
    
    dec dh        ;decreases the vertical coordinate in the graphic interface
    mov ah, 02h
    int 10h
    mov al, 'O'
    mov ah, 09h
    int 10h
none:  
jmp readKey
ret

col db 10
line db 10


