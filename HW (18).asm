include 'emu8086.inc'

org 100h

call scan_num   ;read n 
print 'to the power'
mov bx, cx   ;save n in bx
call scan_num   ;read m (the power to which n is raised)
mov ax, init    ;ax=1 (or n^0)
power:
     
     mul bx  ;multiplies ax with bx (n) until the loop ends
    
loop power
    
call print_num  ;prints the result (saved in ax)

ret    
          
init dw 1 
define_print_num
define_print_num_uns
define_scan_num





