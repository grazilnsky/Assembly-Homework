include 'emu8086.inc'

org 100h

mov cx, n   ;cx becomes the number of elements in the array
lea di, x   ;di points to the address of the array
mov dx, n   ;dx also becomes the number of elements in the array

order:
    print 'x=['
    push cx   ;store cx
    mov si, di
    mov bx, si ;the array is saved in si and bx to allow comparisons between elements
    mov cx, dx ;cx is set to the current value in dx, it is ready for the second loop
 
    minLoop:
        mov ax, [si]   ;move an element into ax 
        call print_num ;print the element in ax
        print ', ' 
        cmp [bx], ax   ;comapre the element in bx with the ones received by ax from si
        jl skip        ;if bx<ax, jump to skip
        mov bx, si     ;if bx>ax, bx becomes the smaller element
        skip:
        add si,2       ;go to the next element
    loop minLoop
     
    dec dx             ;decrease dx with 1
    pop cx             ;restore cx
    print '] '
    print 'min= '
    mov ax, [bx]       ;ax becomes the element with the lowest value
    call print_num     ;print the minimum
    push [bx]
    push [di]          ;switch the element in di with the minimum
    pop [bx]
    pop [di] 
    add di, 2          ;go to the next element
loop order  

mov cx, n              ;cx=n
lea si, x              ;si bercomes the sorted array

print 'sorted=[ '

sortedLoop:
    mov ax, [si]       ;move the current selected element in si to ax
    call print_num     ;print ax
    print ' '
    add si, 2          ;go to the next element
loop sortedLoop
   print ']' 
ret
       
n dw 5
x dw 1, -4, 3, -7, 2
s dw 0
define_print_num
define_print_num_uns     
       
end
