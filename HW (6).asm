include 'emu8086.inc'

org 100h

call scan_num   ;read the first number 
mov bx, cx   ;save the first number in bx 
print '+'
call scan_num   ;read the second number
mov ax, cx   ;save the second number in ax
print '='

add ax, bx  ;compute the sum between the two numbers
call print_num  ;prints the sum


ret    
           
define_print_num
define_print_num_uns
define_scan_num




