include 'emu8086.inc'

org 100h   

lea si, string ;loads the address of s into si
mov cx, n ;set CX to decimal value of n

printLoop:  ;print the string character by character
    putc [si]   ;prints a single character
    inc si      ;increase si by 1

loop printLoop 
ret
   
n dw 10   ;the number of characters in the string 
string db 'teststring'     ;the string itself
end