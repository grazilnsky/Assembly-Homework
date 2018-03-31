include 'emu8086.inc'

org 100h

call scan_num   ;read cx from the keyboard
mov ax, cx      ;move cx into ax, to print it

call print_num  ;print the signed value of ax
printn ''       ;new line
call print_num_uns   ;print unsigned value of ax

ret

define_print_num
define_print_num_uns
define_scan_num


