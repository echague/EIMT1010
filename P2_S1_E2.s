.data 0x00000000
N1:		.word 2
N2:		.word 5
N3:		.word 3
RES:	.space 4

.text

	lhi R1, #0
	lw  R2, 0(R1)	
	lw  R3, 4(R1)	
	add R4, R2, R3
	lw  R5, 8(R1)	
	add R4, R4, R5
	sw 12(R1), R4
	trap #0