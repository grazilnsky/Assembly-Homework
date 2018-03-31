include 'emu8086.inc'

org 100h

lea si, string ;load the string into si
mov cx, n     ;set the value of cx to n
    
toUppercase: 
     cmp [si], 'z'  ;checks if the current character is a lowercase letter
     jbe ok        ;jumps to ok (line 16) if the character is not a lowercase letter
     cmp [si], 'a'
     jae ok
     
     putc [si]       ;the character is printed without making any modifications to it  
     
     ok:

     and byte ptr [si], 11011111b   ;transforms the character into uppercase if it was lowercase          
     putc [si]                      ;prints the uppercase character 

     inc si          ;increments si by 1, going to the next character in the word
           
loop toUppercase       
 
 

ret

n dw 10     ;number of letters
string db 'teStsTring', 0    ;the word


