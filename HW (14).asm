include emu8086.inc
org 100h

lea si, string  ;set si to be the address of the string
mov cx, n       ;number of loops = number of letters
loopCount:
cmp [si], 'Z'    ;compare current character with 'Z'
     jg skip     ;if it is greater than 'Z', jump to skip  
cmp [si], 'A'    ;compare current character with 'A'
     jl skip     ;if it is lower than 'A', jump to skip  
     
    inc bx       ;if the character was proved to be uppercase, increase bx (which counts the number of uppercase letters)
  
skip: 
    inc si       ;go to the next character
loop loopCount


mov ax, bx       ;ax becomes the number of uppercase letters
call print_num   ;print ax


ret

string db 'cOunTmYupPeRcAseS'
n dw 17
define_print_num 
define_print_num_uns
