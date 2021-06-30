        ORG 	100h

        section	.text

        XOR AX, AX
        XOR SI, SI
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX

        MOV 	DX, msg1
        CALL  	CADENA

        MOV 	BP, frase
        CALL  	LeerCadena

        CALL    COMPARAR
        CALL	EsperarTecla

        INT 	20h

        section	.data

        msg1	db	"INGRESA LA CLAVE CORRESPONDIENTE : ", "$"
        msg2    db  "BIENVENIDO", "$"
        msg3    db  "CLAVE INCORRECTA", "$"
        pass 	db 	"ostra6", "$"
        frase 	times 	10  	db	" " 	

        EsperarTecla:
        MOV     AH, 01h         
        INT     21h
        RET

        LeerCadena:
        XOR     SI, SI          
        WHILE:
        CALL    EsperarTecla    
        CMP     AL, 0x0D        
        JE      EXIT            
        MOV     [BP+SI], AL   	
        INC     SI              
        JMP     WHILE           
        EXIT:
        MOV	byte [BP+SI], "$"	
        RET

        COMPARAR:
        XOR     DI, DI          
        
        ITERAR:
        MOV     CX,[pass+DI]
        CMP     DI, 5d          
        JE      EXIT0
        CMP     [frase+DI], CX  
        JE      SUM          
        MOV     DX, msg3       
        CALL    CADENA
        RET

        SUM:
        INC     DI
        JMP     ITERAR
        RET

        CADENA:
        MOV 	AH, 09h
        INT 	21h
        RET

        EXIT0:
        MOV 	DX, msg2
        CALL 	CADENA	
        ret