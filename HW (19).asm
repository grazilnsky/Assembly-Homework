include 'emu8086.inc'

org 100h

print 'Nr, of bytes:'
call scan_num             ;read 1 or 2 from the keyboard
printn ''
mov dx, cx                ;the number of bytes read is saved in dx

    
    cmp dx, 1             ;check if dx is 1
    je continue1          ;if so, jump to reading 1 byte numbers from the keyboard
    bytes:
    cmp dx, 2             ;check if dx is 2
    je continue2          ;if so, jump to reading 2 byte numbers from the keyboard
    
    continue1:            ;1 byte
    print 'First number:'
    printn ''               
    call scan_num         ;scan the first number
    cmp cx, 127           ;it cannot be higher than 127 or lower than -128
    jg continue1          ;violating these rules will force the program to repeat reading the number from the keyboard
    cmp cx, -128
    jl continue1
    mov ax, cx
    
    oneBitTwo:
    print 'Second number:'
    printn ''               
    call scan_num         ;scan the second number
    cmp cx, 127           ;it cannot be higher than 127 or lower than -128
    jg oneBitTwo          ;violating these rules will force the program to repeat reading the number from the keyboard (only the second)
    cmp cx, -128
    jl oneBitTwo
    
    jmp printSum          ;if all conditions were met for the sum to be computed, the program jumps to computing the sum
      
    
    continue2:            ;2 byte
    print 'First number:'
    printn ''               
    call scan_num         ;scan the first number
    cmp cx, 32767         ;it cannot be higher than 32767 or lower than -32768
    jg continue2          ;violating these rules will force the program to repeat reading the number from the keyboard
    cmp cx, -32768
    jl continue2
    mov ax, cx
    
    twoBitTwo:
    print 'Second number:'
    printn ''              
    call scan_num         ;scan the second number
    cmp cx, 32767         ;it cannot be higher than 32767 or lower than -32768
    jg twoBitTwo          ;violating these rules will force the program to repeat reading the number from the keyboard (only the second)
    cmp cx, -32768
    jl twoBitTwo
    
    jmp printSum          ;if all conditions were met for the sum to be computed, the program jumps to computing the sum
    
    printSum: 
        add ax, cx
        printn ''
        print 'sum='
        call print_num
    
 
ret 



define_print_num
define_print_num_uns
define_scan_num


