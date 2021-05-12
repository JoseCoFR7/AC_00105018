org 100h
;Ejercicio 2: Obtener el factorial del numero 5 (5! = 120 -> 78 en hexadecimal) y guardar el resultado en 20Bhn
section .text

    XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 1d 
    MOV BX, 0d 
    MOV CX, 5d 
    call itr
    MOV [20Bh], AX
    call exit

    exit:
    int 20h
    
itr:
    MUL CX
    INC SI 
    LOOP itr
    ret