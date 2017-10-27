 .equ SWI_Exit, 0x11  
 .equ SWI_PrChr, 0x00  
 .equ SWI_PrInt , 0x6b
 .text 
_start:
mov r2 , #50 ;value of n
mov r5 , #0
mov r3 , #150  ;bound on i and j
mov r6, #1
mov r7,#1

loop1:
str r6,[r13,#-4]!
str r7,[r13,#-4]!
bl ishardy
ldr r6,[r13,#4]
ldr r7,[r13,#0]
add r13,r13,#8
cmp r0 , #1
bne inc
add r5,r5,#1
bl print        ;str r4,[r13,#-4]!
inc:
cmp r7,r3
addge r6,r6,#1
movge r7,r6
add r7,r7,#1
cmp r6,r3
bge exit

mul r8,r6,r6
mul r8,r6,r8
mul r9,r7,r7
mul r9,r7,r9
add r4,r8,r9
cmp r5 , r2
blt loop1
bge exit

ishardy:
mov r8,r7
mov r7,r6
mov r6, #0
b findcuberoot
cuberootdone: 
mov r8,r11

hardyloop:
mul r9,r7,r7
mul r9,r7,r9
mul r10,r8,r8
mul r10,r8,r10
add r12 , r9 , r10
cmp r12 , r4

beq equal
blt lessthan
bgt greaterthan

equal:
add r6,r6,#1
cmp r6,#2
beq returntrue
add r7,r7,#1
sub r8,r8,#1
b checkhardy

greaterthan:
sub r8,r8,#1
b checkhardy

lessthan:
add r7,r7,#1
b checkhardy

checkhardy:
cmp r7,r8
bgt returnfalse
b hardyloop

returnfalse:
mov r0 , #0
mov pc , lr

returntrue:
mov r0 , #1
mov pc , lr

print:
mov r1,r4
swi SWI_PrInt
mov r0,#'\n
SWI SWI_PrChr
mov pc,lr


findcuberoot:
mov r11,#1
cubeloop:
mul r9,r11,r11
mul r9,r11,r9
cmp r9,r4
bge cuberootdone
add r11,r11,#1
b cubeloop

exit:
mul r4 ,r2, r12
add r13,r13,r4
swi SWI_Exit

 
