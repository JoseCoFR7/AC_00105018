org 100h
;Ejercicio 1: El promedio de la suma de los 8 dígitos de su carnet, el resultado del promedio guardarlo en 20Ah
;Carnet: 00105018
	section .text

	XOR AX, AX
	XOR BX, BX
	XOR SI,SI
	MOV BL, 8h

	mov     byte[200h], 0d
	mov     byte[201h], 0d
	mov     byte[202h], 1d
	mov     byte[203h], 0d
	mov     byte[204h], 5d
	mov     byte[205h], 0d
	mov     byte[206h], 1d
	mov     byte[207h], 8d

	jmp itr

itr:
	CMP SI, 008h
	JE division

	ADD AL, [200h+SI]
	INC SI 
	LOOP itr

division:
	DIV BL
	MOV [020AH], AL
	jmp exit
exit:
	int 20h