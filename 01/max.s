#PURPOS: To find max number of a set of data items


# VARIABLES: Registers have following use
#  
#
#       %edi - Holds the index of the data item being examined
#       %ebx - Holds the Largest data item
#       %eax - Holds the cyrrent data item
#
#
# data_item - contains the item data. A 0 is being used to mark end 
#
#



.section .data

data_item:
    .long 1,2,3,4,5,6,7,8,9,0

.section .text

.global _start

_start:
    movl $0 , %edi
    movl data_item(,%edi , 4) , %eax
    movl %eax , %ebx


start_loop:
    cmpl $0 , %eax
    je loop_exit
    incl %edi
    movl data_item(,%edi , 4) , %eax
    cmpl %ebx , %eax
    jle start_loop

    movl %eax , %ebx

    jmp start_loop

loop_exit:
    movl $1 , %eax
    int $0x80
