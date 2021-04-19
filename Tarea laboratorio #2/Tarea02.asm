    org 100h

;Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h 
    mov AL, 'F'
    mov [200h], AL
    mov AL, 'J'
    mov [201h], AL
    mov AL, 'C'
    mov [202h], AL
    mov AL, 'E'
    mov [203h], AL

;Copiar el valor de 200h a AX usando direccionamiento directo.
    mov AX, [200h]

;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
    mov BX, [201h]
    mov CX, BX

;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
    mov BX, 200h
    mov SI, 2h
    mov DX, DS:[BX+SI]

;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
    mov SI, 3h
    mov DI, DS:[200h+SI]

    int 20h