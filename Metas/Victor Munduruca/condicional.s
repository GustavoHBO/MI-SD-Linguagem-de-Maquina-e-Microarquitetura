#Victor Munduruca, Condicionais e Loop em Assembly

movi r2, 10 # inicializa os dois registradores
movi r3, 1


loop: 
	beq r2, r3, termina #o loop e incrementado ate o valor de r2 e r3 serem iguais
	addi r3, r3, 1
	call loop
termina:
