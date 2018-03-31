include 'emu8086.inc'
org 100h


;this program checks if a string is palindrome using a string and its copy
;it goes through the original string starting from the end (length-1)
;it goes through the copy starting from the first character (0)
;checks if the characters on positions si (on original string) and di (on copy) are equal
;if they are all equal, si must be 0, thus the string will be palindrome

mov si, 6  ;si = the length of our string minus 1
mov di, 0  ;di =0 (the first character)
pal:
    mov  al, string[si]  ;al = the character on the position si in the string
    mov ah, copy[di]     ;ah = the character on the position di in the string
    cmp al , ah          ;compare al and ah
    jne skip             ;if they are different, the string is not palindrome
    cmp si, 0            ;compare si and 0
    je isPal             ;if they are equal, it means the number is palindrome, because the program will have already gone through all characters by the time si is 0
    dec si               ;decrease si
    inc di               ;increase di
jmp pal

isPal:    ;prints a message saying it is palindrome
    print 'Your string is a palindrome'
    jmp ending
skip:     ;prints a message saying it is not palindrome
    print 'Your string is not a palindrome'
ending:   
ret

string db 'racecar'
copy db 'racecar'
define_scan_num
define_print_num
define_print_num_uns








 
