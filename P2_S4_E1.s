.data 0x00000000
V:		.word 0,1,0,1,1
W:		.word 1,2,3,4,5
DIM:		.word 5
SUMA:                       .space 4
.text
		lw r1,DIM(r0) ;recuerda que r0 siempre vale 0
		lhi r3,#0	
		lhi r2,#0
bucle: 		lw r5, W(r2)
		subi r1,r1,#1
		lw r4, V(r2)	
		beqz r4, nosuma
		add r3,r5,r3
		sw SUMA(r0),r3
nosuma:		addi r2,r2,#4
		bnez r1, bucle
		trap #0