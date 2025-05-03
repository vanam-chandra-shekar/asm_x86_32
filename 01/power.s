.section .data

.section .text
.global _start

_start:

    pushl $2
    pushl $4
    call power
    addl $8 , %esp

    pushl %eax
    call exit
    addl $4 , %esp


.type power , @function
power:
    pushl %ebp
    movl %esp , %ebp

    movl 8(%ebp) , %edi
    movl 12(%ebp) , %ebx

    movl $1 , %eax

power_loop:
    cmp $0 , %edi
    je power_exit

    imull %ebx , %eax
    decl %edi
    jmp power_loop

power_exit:
    popl %ebp
    ret

.type exit , @function
exit:
    pushl %ebp
    movl %esp , %ebp

    movl 8(%ebp) , %ebx
    movl $1 , %eax
    
    int $0x80

    popl %ebp
    ret

