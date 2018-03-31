include 'emu8086.inc'

org 100h

mov ax, sum ;ax is set to 0
mov cx, n ;the number of elements
lea di, x ;sets di as the address of x

mov si, di  ;si becomes the first element in the array
sumArray:
   add ax, [si]   ;adds the current selected number in the array to the sum
   add si,2       ;goes to the next element
loop sumArray 

print 'sum= '
call print_num   ;prints the sum of the array
   
ret
sum dw 0       
n dw 5
x dw 4, 8, -3, 3, 1
define_print_num
define_print_num_uns     
       
end




