.att_syntax 

.section .multiboot
.align 4
.long 0x1BADB002         
.long 0x00000003         
.long -(0x1BADB002 + 0x00000003) 


.section .text
.global _start
.type _start, @function
_start:
    movl $stack_top, %esp
    push %ebx
    push %eax
    call kernel_main
    cli
1:  hlt
    jmp 1b
    

.section .bss
.align 16
stack_bottom:
    .skip 16384
.global stack_top
stack_top:
