.section .init
.globl _start
_start:
ldr r0,=0x20200000
mov r1,#1
lsl r1,#18
str r1,[r0,#4]

/* 
* Set the 16th bit of r1.
*/

mov r1,#1
lsl r1,#16

/* NEW
* Label the next line loop$ for the infinite looping
*/

loop$: 

/*
* Set GPIO 16 to low, causing the LED to turn on.
*/

str r1,[r0,#40]
mov r2,#0x3F0000
wait1$:
	sub r2,#1
	cmp r2,#0
	bne wait1$
	
/* NEW
* Set GPIO 16 to high, causing the LED to turn off.
*/

str r1,[r0,#28]

/* NEW
* Wait once more.
*/

mov r2,#0x3F0000
wait2$:
	sub r2,#1
	cmp r2,#0
	bne wait2$
b loop$
