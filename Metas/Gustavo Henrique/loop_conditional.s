##############################
# Exemplo: loop_conditional.s
# Incrementa o registrador r4 até seu valor ser igual ao registrador r3
##############################

addi r3, r0, 1000
addi r4, r0, 0

_loop:
	bne r3, r4, _incrementa # Caso r3 seja diferente de r4, chama a rotina _incrementa
	ret # termina o loop
	

_incrementa:
	addi r4, r4, 1 # incrementa em 1 o valor de r4
	call _loop # chama a rotina _loop