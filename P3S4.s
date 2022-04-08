#include <iregdef.h>
.data 0x00000000
Valor:  .word 0
V1:     .word 1, 2, 3, 4, 5, 6
V2:     .word 6, 5, 4, 3, 2, 1


.text
.align 4
.globl start
.ent start
start:  li   t1, 0         # Desplazamiento en memoria del vector
        li   t2, 0         # Contador de elementos del vector
bucle:  lw   t3, V1(t1)    # t3 <- V1[i]
        lw   t4, V2(t1)    # t4 <- V2[i]
        lw   t5, Valor     # t5 <- Valor
        add  t5, t5, t3    # t5 <- t5 + t3
        add  t5, t5, t4    # t5 <- t5 + t4
        sw   t5, Valor     # Valor <- t5
        addi t1, t1, 4     # Incremento del desplazamiento en memoria
        addi t2, t2, 1     # Incremento del contador del vector
        bne  t2, 6, bucle  # Repetir mientras el contador del vector < 6
        j _exit            # Fin del programa
.end start
