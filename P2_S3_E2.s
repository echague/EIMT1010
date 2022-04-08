.data 0x00000000
V:	.word 1,2,3,4,5
X:	.word 3
DIM: 	 .word 5
RES: 	 .space 4

.text
	   lhi  r3,#0		
	   lhi  r6,#0   
	   lw   r2, X(r0)    
	   lw   r1,DIM(r0)	
bucle: 	   beqz r1,finbucle
	   lw   r4,V(r3)	
	   sgt  r5, r4, r2        ; Pone r5 a 1 si r4>r2 sino r5 a 0
	   beqz r5, else     ; SI r5 = 0 salta a else en caso contrario ejecuta la parte del if
if:	   add  r6,r6,r4        
	   j finsi                     ; salta fuera del if
else:	   sub  r6, r6, r4
finsi:	   subi r1,r1,#1
           addi r3,r3,#4
           j bucle
finbucle:  sw RES(r0), r6
	   trap #0
