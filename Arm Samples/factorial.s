@@@ Factorial of an integer N

main:
mov r0, #5			@ Initializing the value of N to 5
mov r1, r0

factorial:
cmp r0, #0
moveq r0, #1
beq exit
sub r0, r0, #1
cmp r0, #0
moveq r0, #1
beq exit
mov r2, r1
mul r1, r2, r0		@ fact(N-1) * N
cmp r0, #1			@ check if(N <= 1)
bne factorial		@ recursive call to fact if N != 1
mov r0, r1			@ r0 contains the result
swi 0x02

exit:
swi 0x11
