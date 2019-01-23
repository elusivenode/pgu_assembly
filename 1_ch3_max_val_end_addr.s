#PURPOSE:	This program find the minimum number of a set of data items.
#
#VARIABLES:	The registers have the following uses:
#
# %edi - holds the index of the data item being examined
# %ebx - smallest data item found
# %eax - current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. Modified to exit based on address offset, not a 0 in the list.
#

.section .data

 data_items:
 .long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66

.section .text

.globl _start
_start:
 movl $0, %edi
 movl data_items(,%edi,4), %eax
 movl %eax, %ebx

start_loop:
 cmpl $13, %edi
 je loop_exit
 incl %edi
 movl data_items(,%edi,4), %eax
 cmpl %ebx, %eax
 jle start_loop
 movl %eax, %ebx
 jmp start_loop

loop_exit:
 movl $1, %eax
 int $0x80


