    ORG	100h

    SECTION .data

    data  db	1,3,4,10,11,20,23,24,25,39

    len   equ  $-data

    SECTION .text

    CALL VRF

    EXIT: int	20h
    VRF:
    XOR AX, AX
    XOR SI, SI
	XOR CX, CX
    MOV AL,2d

    RUTA: 
	XOR BX, BX
	MOV	BL, [data+SI]
	CMP	BL, 0xA
	JE	EXIT
	DIV	AL
	CMP	BH, 0d
	JE	PAR
	JMP	IMPAR

    PAR:	
	MOV	BL, [data+SI]
    MOV [SI+300h],BL
    INC SI
    JMP RUTA

    IMPAR:
	MOV	BL, [data+SI]
    MOV [SI+320h],BL
    INC SI
    JMP RUTA