include 'emu8086.inc'

org 100h

mov cx, n  ;the number of elements
lea si, x  ;loads address of first array
lea di, y  ;loads address of second array

sum:
    mov ax, [si]  ;ax is the current selected element in first array
    mov bx, [di]  ;bx is the current selected element in second array
    
    add ax, bx    ;add ax and bx (the sum of the elements on the currently selected position)
   
    call print_num   ;print the sum
         
    print ', '
    add si, 2     ;go to next element (in first array)
    add di, 2     ;go to next element (in second array)
loop sum


ret

x dw 3, 5, 6, 3, 9    ;first array
y dw -3, 8, 21, 7, -12   ;second array
n dw 5                   ;number of elements
define_print_num
define_print_num_uns

