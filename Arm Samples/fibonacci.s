mov r3, #20
mov r2, #0
mov r5, #1
mov r3, #18

LOOP:
CMP r3, #1

BLT EXIT 
ADD r4,r2,r5
mov r2,r5
mov r5,r4 

SUB r3,r3, #1


B LOOP

EXIT:
swi 0x11


