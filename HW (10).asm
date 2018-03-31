include 'emu8086.inc'

org 100h

mov cx, n ;the number of elements
lea di, x ;sets di as the address of x


print 'x=['
mov si, di  ;si becomes the first element in the array
mov bx, si  ;bx becomes the first element (bx is the maximum element, currently)

label1:
   mov ax, [si]   ;the current selected number in the array
   call print_num  ;prints ax
   print ', ' 
   cmp [bx], ax     ;compares bx with ax
   jg skip          ;if bx>ax, jump to skip
   mov bx, si     ;if bx<ax, bx becomes the current selected number (si)
   skip:
   add si,2       ;goes to the next element
loop label1 

print '] '
print 'max= '
mov ax, [bx]     ;prepares the maximum to be printed
call print_num   ;prints the maximum
   
ret
       
n dw 5
x dw 4, 8, -3, 3, 1
define_print_num
define_print_num_uns     
       
end
