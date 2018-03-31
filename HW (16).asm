include 'emu8086.inc'

org 100h

call scan_num
mov ax, n
mov bx, m
cmp cx, 1
    je firstTerm
cmp cx, 2
    je secondTerm
cmp cx, bx
    jg fibo
firstTerm:
    print 'f'
    call print_num
    jmp skip
secondTerm:
    print 's'
    mov ax, bx
    call print_num
    jmp skip
fibo:     
sub cx, 2
fiboNthTerm:
    mov dx, ax
    add dx, bx
    mov ax, bx
    mov bx, dx
loop fiboNthTerm

mov ax, bx
call print_num

skip:
ret

n dw 0
m dw 1
define_print_num
define_print_num_uns
define_scan_num


