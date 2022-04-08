# Fichero: Suma3Vect.s  V4[i]=V1[i]+V2[i]+V3[i]
#include <iregdef.h>
# Incluimos los alias de los registros

### Segmento de datos
.data	
V1: .word 1, 2, 3, 4, 5, 6, 7, 8
V2: .word 9, 10, 11, 12, 13, 14, 15, 16
V3: .word 17, 18, 19, 20, 21, 22, 23, 24
V4: .word 0, 0, 0, 0, 0, 0, 0, 0

### Segmento de texto (programa)
.text				# Comienzo de seccion de codigo de usuario
.align	2			# Alineamiento en formato palabra (multiplo de 4)
.globl	start		# La etiqueta "start" se hace conocida a nivel global
.ent	start		# La etiqueta "start" marca el punto de inicio

start:  la t1, V1
        la t2, V2
        la t3, V3
        la t4, V4
        li t5, 0  # contador 8 iteraciones
bucle:  lw t6, (t1)
        lw t7, (t2)
        add t6, t6, t7 
        lw t7, (t3)  
        add t6, t6, t7  
        sw t6, (t4) # almacenamos V4
        addi t1, t1, 4
        addi t2, t2, 4
        addi t3, t3, 4
        addi t4, t4, 4
        addi t5, t5, 1
        bne t5, 8, bucle
		j       _exit		# Saltamos a la rutina de salida para terminar
		.end    start		# Final de la seccion "start"
		