# Fichero:         Sumavect1-16.s						
#include <iregdef.h>

.data	 					# Zona de datos en memoria
V1:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
suma: 	.word 0
					
.text						# Seccion de codigo
		.align	4			# Alineamiento en formato palabra (multiplo de 4)
		.globl	start 		# La etiqueta "start" se hace conocida a nivel global
		.ent	start		# La etiqueta "start" marca un punto de entrada

start:  la t1, V1			#Direccion del vector V1
        li t3, 0			#Contador elementos del vector
bucle:  lw t4, (t1)			#Carga el elemento del vector
    	lw t2, suma         #Carga la variable suma en t2
        addu t2, t2, t4    	#suma=suma+V1[t1]
	sw t2, suma 	        #Almacena la suma en memoria
        addi t1, t1, 4      #Direccion del siguiente elemento del vector
        addi t3, t3, 1		#Incrementamos contador elementos del vector
        bne t3, 16, bucle	#Salta a bucle hasta llegar al ultimo elemento 
	j       _exit			#Saltamos a la rutina de salida para terminar
	.end    start			#Final de la seccion "start"
