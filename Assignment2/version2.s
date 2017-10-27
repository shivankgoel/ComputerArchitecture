.equ SEG_A,0x80
.equ SEG_B,0x40
.equ SEG_C,0x20
.equ SEG_D,0x08
.equ SEG_E,0x04
.equ SEG_F,0x02
.equ SEG_G,0x01
.equ SEG_P,0x10

 .text 
_start:

mov r4,#0    @x-coordinate
mov r5,#0       @vind
mov r6,#8192    @stack1 8000
mov r7,#12288    @values 2000 
mov r8,#16384  @operands 4000
mov r12,#20480  

ldr r5,=0x80000001

sub r13,r13,#40;
str r5,[r13,#0]
str r5,[r13,#4]
str r5,[r13,#8]
str r5,[r13,#12]
str r5,[r13,#16]
str r5,[r13,#20]
str r5,[r13,#24]
str r5,[r13,#28]
str r5,[r13,#32]
str r5,[r13,#36]

mov r5,#0

displayscreen:

mov r0,#0
mov r1,#0
mov r2,#'v
swi 0x207
mov r1,#1
swi 0x207
mov r1,#2
swi 0x207
mov r1,#3
swi 0x207
mov r1,#4
swi 0x207
mov r1,#5
swi 0x207
mov r1,#6
swi 0x207
mov r1,#7
swi 0x207
mov r1,#8
swi 0x207
mov r1,#9
swi 0x207

mov r0,#1
mov r2,#0
mov r1,#0
swi 0x205
mov r2,#1
mov r1,#1
swi 0x205
mov r2,#2
mov r1,#2
swi 0x205
mov r2,#3
mov r1,#3
swi 0x205
mov r2,#4
mov r1,#4
swi 0x205
mov r2,#5
mov r1,#5
swi 0x205
mov r2,#6
mov r1,#6
swi 0x205
mov r2,#7
mov r1,#7
swi 0x205
mov r2,#8
mov r1,#8
swi 0x205
mov r2,#9
mov r1,#9
swi 0x205


ldr r2,=Digits
    ldr r0,[r2,#0]
    swi 0x200


mainloop:
	bl checkblue
	checkedblue:
	bl checkblack           
	b mainloop                       

checkblue:
	mov r0,#17
	mov r1,#1
	swi 0x203
	cmp r0,#1
	beq button1      
	cmp r0,r1,lsl #1
	beq button2
	cmp r0,r1,lsl #2
	beq button3      
	cmp r0,r1,lsl #3
	beq button4
	cmp r0,r1,lsl #4
	beq button5      
	cmp r0,r1,lsl #5
	beq button6
	cmp r0,r1,lsl #6
	beq button7      
	cmp r0,r1,lsl #7
	beq button8
	cmp r0,r1,lsl #8
	beq button9      
	cmp r0,r1,lsl #9
	beq button10
	cmp r0,r1,lsl #10
	beq button11      
	cmp r0,r1,lsl #11
	beq button12
	cmp r0,r1,lsl #12
	beq button13      
	cmp r0,r1,lsl #13
	beq button14
	cmp r0,r1,lsl #14
	beq button15      
	cmp r0,r1,lsl #15
	beq button16
	b checkedblue

checkblack:
	mov r0,#0x04
	swi 0x202
	cmp r0,#0x01
	beq rightblack            
	cmp r0,#0x02
	beq leftblack
	mov pc,lr

rightblack:
	cmp r5,#9
	moveq pc,lr
	add r5,r5,#1
    
    ldr r2,=Digits
    ldr r0,[r2,r5,lsl#2]
    swi 0x200
	 
	mov pc , lr

leftblack:
	cmp r5,#0
	moveq pc,lr
	sub r5,r5,#1


	ldr r2,=Digits
    ldr r0,[r2,r5,lsl#2]
    swi 0x200

	mov pc , lr

leftled:
	mov r0,#0x02
	swi 0x201             
	mov pc,lr

rightled:
	mov r0,#0x01
	swi 0x201  
	b mainloop      

button1:
	mov r2,#0
	str r2,[r6,#-4]!
	
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1

	b mainloop

button2:
	mov r2,#1
	str r2,[r6,#-4]!
	
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
    
    b mainloop


button3:
	mov r2,#2
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
    b mainloop


button4:
	mov r2,#3
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button5:
	mov r2,#4
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button6:
	mov r2,#5
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button7:
	mov r2,#6
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button8:
	mov r2,#7
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button9:
	mov r2,#8
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button10:
	mov r2,#9
	str r2,[r6,#-4]!
	mov r0,r4    @xcord               
    mov r1,#11   @ycord
    swi 0x205
    add r4,r4,#1
	b mainloop


button11:     

	
	mov r0,#0x00
	swi 0x201    
	
    bl assign        @assign
	str r0,[r13,r5,LSL #2]  @stored value on stack 

	cmp r0,#0
	bge printpositive
	blt printnegative

printpositive:

	mov r0,r5
    swi 0x208

    mov r0,#0
    mov r1,r5
    mov r2,#'v
    swi 0x207

    mov r0,#1
    mov r1,r5
    mov r2,r5
    swi 0x205

	ldr r2,[r13,r5,LSL #2]
	mov r0,#4
    mov r1,r5
    swi 0x205

	mov r0,#11
	swi 0x208
	
	mov r4,#0
	
	b mainloop

printnegative:

	
	mov r0,r5
    swi 0x208

    mov r0,#0
    mov r1,r5
    mov r2,#'v
    swi 0x207

    mov r0,#1
    mov r1,r5
    mov r2,r5
    swi 0x205


    mov r0,#4
    mov r1,r5
    mov r2,#'-
    swi 0x207

	ldr r2,[r13,r5,LSL #2]
	mvn r1,r2
	add r2,r1,#1
	mov r0,#5
    mov r1,r5
    swi 0x205

	mov r0,#11
	swi 0x208
	
	mov r4,#0
	
	b mainloop




button12:           @recall
	ldr r2,[r13,r5,LSL #2]
	str r2,[r6,#-4]!

	cmp r2,#0x80000001
	bleq leftled
	beq mainloop


	mov r0,#0x00
	swi 0x201             

	mov r0,r4
    mov r1,#11
    mov r2,#'v
    swi 0x207
	add r4,r4,#1

	mov r0,r4
    mov r1,#11
    mov r2,r5
    swi 0x205
    add r4,r4,#1

    b mainloop
    

button13:           @addition
	mov r0,#12       
	str r0,[r6,#-4]!
	mov r0,r4
    mov r1,#11
    mov r2,#'+
    swi 0x207
    add r4,r4,#1
	b mainloop


button14:           @subtraction
	mov r0,#13
	str r0,[r6,#-4]!
	mov r0,r4
    mov r1,#11
    mov r2,#'-
    swi 0x207
    add r4,r4,#1
	b mainloop

button15:            @multiplication
	mov r0,#14
	str r0,[r6,#-4]!
	mov r0,r4
    mov r1,#11
    mov r2,#'*
    swi 0x207
    add r4,r4,#1
	b mainloop


button16:            @division
	mov r0,#15
	str r0,[r6,#-4]!
	mov r0,r4
    mov r1,#11
    mov r2,#'/
    swi 0x207
    add r4,r4,#1
	b mainloop

assign:
	str r14,[r13,#-4]!
	
	bl createnewstack


	mov r11,#0  @n=0

assignloop:
	cmp r12,#20480    @equivalent to while x[i] ! = 10
	bge outerwhiledone
				     @ r9 = x[i]
	ldr r9,[r12,#0] 
	add r12,r12,#4

	bl checknotoperand   @ x[i] ! = 12,13,14,15 true if r0 = 1
	cmp r0,#1
	beq incn
    bne operandcase

outerwhiledone:
	str r11,[r7,#-4]!  @push n in stack
	
	emptyoperandloop:
	cmp r8,#16384
	bge evaluateinfixdone
	bllt evaluate
	b emptyoperandloop

evaluateinfixdone:
	ldr r0,[r7,#0]
	add r7,r7,#4
	ldr r14,[r13,#0]
	add r13,r13,#4
	mov pc,lr

incn:
    mov r10,#10            
	smull r11,r0,r10,r11      @ n= 10 * n
	cmp r0,r11, ASR #31       @checkoverflow
	bne rightled
	cmp r11,#0
	addges r11,r11,r9
	sublts r11,r11,r9       @ n = 10 *n + newdigit
	bvs rightled
	b assignloop

operandcase:
		str r11,[r7,#-4]!   @store n in values stack
		mov r11,#0          @ set n =0

		innerwhileloop:      @chheck if r9 operand has lowerprecedence than 
		bl checkhighprec
		cmp r0,#1
		bne exitinnerwhile    @if r9 has higher or same then exit ineer and push r9 in stk
		bleq evaluate         @ else evaluate 
		b innerwhileloop	@ and check again if r9 has higher prec

exitinnerwhile:
str r9,[r8,#-4]!         @ push operand in operand stack
b assignloop              @ assignloop sees if r12 is empty


checknotoperand: 
	cmp r9,#12
	beq returnfalse
	cmp r9,#13
	beq returnfalse
	cmp r9,#14
	beq returnfalse
	cmp r9,#15
	beq returnfalse
	b returntrue

checkhighprec:   @checks if top element of stack has higher prec
	cmp r8,#16384
	bge returnfalse;
	ldr r10,[r8,#0]
	cmp r10,r9
	bgt returntrue
	b returnfalse

returntrue:
	mov r0,#1
	mov pc,lr
returnfalse:
	mov r0,#0
	mov pc,lr

evaluate:
	str r14,[r13,#-4]!

	ldr r10,[r8,#0]     @ r10 has operator
	add r8,r8,#4			
	
	ldr r2,[r7,#0]		@ r2 has operand1
	add r7,r7,#4

	cmp r7,#12288       @r3 has operand 2
	ldrlt r3,[r7,#0]  
	addlt r7,r7,#4
    movge r3,#0
	
	cmp r10,#12
    addeqs r3,r3,r2
	cmp r10,#13
	subeqs r3,r3,r2   @operand2 - operand1

	bvs rightled

	cmp r10,#14
	bleq multiply


	cmp r10,#15
	bleq divide           @bl if equal   operand2/operand1

    str r3,[r7,#-4]!     @push after evaluating into operand stack

    ldr r14,[r13,#0]
    add r13,r13,#4
	mov pc , lr

multiply:
	smull r3, r0, r2, r3   @check r0  
    cmp r0, r3, ASR #31  
    bne rightled
    mov pc,lr


divide:
	str r14,[r13,#-4]!
	mov r0,#0
	
	cmp r3,#0
	blt negdiv1
	
	cmp r2,#0
	blt negdiv2
	beq rightled      @division by zero
	
	divloop:
	cmp r3,r2           @divide r3 by r2
	blt divcomplete 
	sub r3,r3,r2
	add r0,r0,#1
	b divloop

	divcomplete:
	ldr r14,[r13,#0]
	add r13,r13,#4
	mov r3,r0
	mov pc,lr


negdiv1:
mvn r10,r3
add r3,r10,#1

cmp r2,#0
blt negdiv3

divloop1:            @only r3 negative and check if r2 is also negative
	cmp r3,r2           @divide r3 by r2
	blt divcomplete1 
	sub r3,r3,r2
	add r0,r0,#1
	b divloop1

divcomplete1:
	mvn r10,r0
	add r0,r10,#1
	ldr r14,[r13,#0]
	add r13,r13,#4
	mov r3,r0
	mov pc,lr

negdiv3:  @both r2 and r3 negative
mvn r10,r2
add r2,r10,#1


divloop3:
	cmp r3,r2           @divide r3 by r2
	blt divcomplete 
	sub r3,r3,r2
	add r0,r0,#1
	b divloop3

negdiv2:  @ only r2 negative

mvn r10,r2
add r2,r10,#1


divloop2:
cmp r3,r2           @divide r3 by r2
blt divcomplete1 
sub r3,r3,r2
add r0,r0,#1
b divloop2






createnewstack:  @ using r6
str r14,[r13,#-4]!
loop1:
cmp r6,#8192
bge complete
ldr r9,[r6,#0]
add r6,r6,#4

bl checknotoperand
cmp r0,#1
streq r9,[r12,#-4]!
beq loop1

cmp r9,#13
strne r9,[r12,#-4]!
bne loop1
beq manage 

manage:
mov r10,r9          @ r10 = 13
ldr r9,[r6,#0]
bl checknotoperand
cmp r0,#1
streq r10,[r12,#-4]!
beq loop1

ldr r10,[r12,#0]
mvn r9,r10
add r9,r9,#1
str r9,[r12,#0]
b loop1

complete:
ldr r14,[r13,#0]
add r13,r13,#4
mov pc,lr



Digits:
.word SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_G @0
.word SEG_B|SEG_C @1
.word SEG_A|SEG_B|SEG_F|SEG_E|SEG_D @2
.word SEG_A|SEG_B|SEG_F|SEG_C|SEG_D @3
.word SEG_G|SEG_F|SEG_B|SEG_C @4
.word SEG_A|SEG_G|SEG_F|SEG_C|SEG_D @5
.word SEG_A|SEG_G|SEG_F|SEG_E|SEG_D|SEG_C @6
.word SEG_A|SEG_B|SEG_C @7
.word SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G @8
.word SEG_A|SEG_B|SEG_F|SEG_G|SEG_C @9
.word 0 @Blank display