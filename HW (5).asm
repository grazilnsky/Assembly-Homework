

org 100h

lea dx, string

mov ah, 0ah   ;prepare the input
int 21h       ;read the input

mov bx, dx
mov ah, 0
mov al, ds:[bx+1]
add bx, ax          ;bx is the end of the string
mov byte ptr [bx+2], '$' ;adds a dollar sign at the end of the string
lea dx, new_line         ;goes to the next line    
mov ah, 09h          ;prepare to print
int 21h              ;print the original string

lea bx, string
add bx, 2     
upperCase: 
     cmp byte ptr [bx], 'a'  ;checks if the current character is a lowercase letter
     jb isUpper            ;if its ascii code is lower than 'a', jumps to isUpper
     
     low1:        ;jumps to lowerToUpper (line 31) if the character is not a lowercase letter
        cmp byte ptr [bx], 'z' ;compares current character with 'z'
        jbe lowerToUpper             ;if its ascii code is lower than 'z', jumps to lowerToUpper 
        
     jmp isUpper  ;jumps past lowerToUpper
     
     lowerToUpper:
        add byte ptr [bx], -32  ;transforms the character into uppercase if it was lowercase             
     jmp next   ;if a character's case has been changed, jump to the next char
     
     isUpper: 
         cmp byte ptr [bx], 'A' ;checks if the current character's ascii code is higher than or equal to 'A'
         jae isUpper1:   ;if so, jumps to the next verification
     
         isUpper1:
            cmp byte ptr [bx], 'Z' ;checks if the current character's ascii code is lower than or equal to 'Z'
            jbe upperToLower   ;if so, jumps to upperToLower
     
     upperToLower:
        add byte ptr [bx], 32  ;change the character from uppercase to lowercase
     
     next:             
        inc bx ;increments bx by 1, going to the next character 
        cmp byte ptr [bx], '$' ;if the current character is '$', it means this is the end of the string
        je skip  ;if a character is '$', jump to skip
loop upperCase
   
skip:
lea dx, string+2  ;prepare to print
mov ah, 09h
int 21h          ;print the newly changed string
ret



string db 20, 22 dup('?')

new_line db 0Dh,0Ah, '$'
