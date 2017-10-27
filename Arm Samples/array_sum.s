@@@ Find square of sum of array elements

@ Writing to the array
	mov r1, #10	@ Max size of the array
	mov r2, #1
	mov r3, #100	@ Starting address of the array
Lab1:
	str r2, [r3]	@ Stores i at array[i]
	add r3, r3, #4	@ pointing next index 
	add r2, r2, #1
	sub r1, r1, #1
	cmp r1, #0
	bne Lab1

@ Reading from the array
	mov r1, #10
	mov r4, #0
	mov r3, #100 
Lab2:
	ldr r2, [r3]
	add r4, r4, r2
	add r3, r3, #4
	sub r1, r1, #1
	cmp r1, #0
	bne Lab2

@ Square of the sum of the array elements
	mul r5, r4, r4
