include 'emu8086.inc'

org 100h

call scan_num   ;read the number and save it in cx
mov ax, cx      ;save the number in ax
call print_num  
print '!=' 
   
   
mov ax,s     ;ax = 1
factorial:
     
     mul cx  ;multiplies ax with cx until the loop ends
    
loop factorial
    
call print_num  ;prints the result (saved in ax)

ret    
          
s dw 1 
define_print_num
define_print_num_uns
define_scan_num





