##############################
# Exemplo: loop_conditional_xor.s
# Faz operação XOR entre os registradores r2 e r3, incrementando o r3 até a XOR entre os valores sejam 0.
##############################

addi r2, r0, 10
addi r3, r0, 0

_loop:
	xor r4, r2, r3
	addi r3, r3, 1
	bne r0, r4, _loop
	addi r3, r3, -1