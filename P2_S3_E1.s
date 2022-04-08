.data 	0x00000000
V1: 	.word 1,2,3,4,5
V2: 	.word 5,4,3,2,1
V3: 	.space 20
DIM: 	.word 5
.text
	lw   r1,DIM(r0)
	lhi  r2,#0

bucle: 	beqz r1,finbucle
	lw   r3,V1(r2)
	lw   r4,V2(r2)
	subi r1,r1,#1
	add  r5,r3,r4
	sw   V3(r2), r5
	addi r2,r2,#4
	j bucle		
finbucle: 
	trap #0
