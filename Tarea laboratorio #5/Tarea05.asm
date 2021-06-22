    ORG 100H

    section .text
    XOR AX, AX
    XOR SI, SI
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV SI, 0
    MOV DI, 0D

    MOV DH, 10 
    MOV DL, 20 

    CALL SHOWTEXT

    LOOP1:
    CALL MOVECURSOR
    MOV CL, [NAME+SI]
    CMP CL, 20H
    JE SNT
    CALL SHOWCHAR
    INC SI
    INC DL
    INC DI 
    CMP DI, 32D
    JB LOOP1
    JMP WT

    SHOWTEXT: 
    MOV AH, 0H
    MOV AL, 03H
    INT 10H
    RET

    MOVECURSOR:
    MOV AH, 02H
    MOV BH, 0H
    INT 10H
    RET

    SHOWCHAR:
    MOV AH, 0AH
    MOV AL, CL 
    MOV BH, 0H
    MOV CX, 1H
    INT 10H
    RET

    WT:
    MOV AH, 00H 
    INT 16H

    EXIT:
    INT 20H

    SNT:
    ADD DH, 5
    INC SI 
    MOV DL, 20 
    INC DI 
    JMP LOOP1

    section .data
    NAME DB 'FRANCISCO JOSE CORNEJO ESCALANTE'