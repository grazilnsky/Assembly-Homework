include 'emu8086.inc'

org 100h  

;DISCLAIMER: the program does not print the sum correctly
;that is because I do not know how not to print only the address (i think?) of the numbers


mov cx, n     ;cx is the number of characters in the string
sub cx, 3     ;subtract 2 from it, to turn the 4th and 5th characters to an integer
mov bx, 0     ;the number we want to find will be saved in bx
mov dx, 4     ;counter
mov di, 3     ;the position of current character

secondNumber:
    push cx     ;save cx in stack
    mov cx, 10  ;cx = 10
    mov ax, bx  ;prepare ax for modifications
    cmp string[di], '0'  ;check if the current character is a number 
    jge checkNumber2     ;if it is >=0 jump to check if the character is <=9
    
    checkNumber2:
        cmp string[di], '9'
        jle parseNumber2    ;if so, jump to parse it into an int
    
    parseNumber2:
        sub string[di], 48   ;
        mov bx, string[di]    ;bx is the current selected number
        mul cx                ;multiply ax by 10
        add ax, bx            ;add bx to ax
        mov bx, ax            ;store the newly formed number in bx
    inc di                  ;di increases
    pop cx                  ;restore cx
    dec dx                  ;counter decreases
    cmp dx, 2               ;if the counter is 2
    je skip1               ;exit loop
    
loop secondNumber

skip1:  
mov ax, bx     ;the second number of the operation is saved in ax
push ax ;store the number
lea si, string    ;si = address of the string
mov cx, n        ;cx = number of elements
mov bx, 0        ;number we want to parse from character to integer
mov di, 0        ;counter

firstNumber:
    push cx      ;store cx in stack
    mov cx, 10   ;cx = 10
    mov ax, bx   ;prepare ax for modifications
    cmp [si], '0'    ;check if the current character is a number
    jge checkNumber   ;if it is >=0 jump to check if the character is <=9
    
    checkNumber:
        cmp [si], '9'
        jle parseNumber  ;if so, jump to parse it into an int
    
    parseNumber:
        sub [si], 48
        mul cx          ;multiply ax by 10
        mov ax, [si]    ;ax is the current character 
        add bx, ax      ;add ax to the newly formed number
                 
    inc si       ;go to next char
    pop cx       ;restore cx
    inc di       ;increase counter
    cmp di, 2    ;if the counter is 2
    je ending   ;exit loop
   
loop firstNumber
 
skip2:
mov dx, bx    ;first number = dx
pop ax ;restore the second number
mov bx, ax ;second number is bx
mov ax, dx ;first number is ax

cmp string[2], '+'  ;addition
    add ax, bx
    jmp ending
cmp string[2], '*'  ;multiplication
    mul bx
    jmp ending
cmp string[2], '-'  ;subtraction
    sub ax, bx
    jmp ending
cmp string[2], '/'  ;division
    div bx
    jmp ending
ending:

call print_num      ;print result 

ret

string dw '45+30'
n dw 5
define_print_num
define_print_num_uns
