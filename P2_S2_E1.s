.data 0x00000000
V: .word 1,2,3,4,5
DIM: 	.word 5
RES:	.space 4

.text
		lhi  r4,#0
		lhi  r5,#0
		lw   r1,DIM(r0)
bucle: 	beqz r1,finbucle
		lw   r3,V(r4)
		add  r5,r5,r3
		subi r1,r1,#1
		addi r4,r4,#4
		j bucle
finbucle: sw RES(r0),r5
		trap #0