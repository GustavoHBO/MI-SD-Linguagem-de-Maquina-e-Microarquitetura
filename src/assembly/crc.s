

# Declaração dos valores a serem utilizados
.data
	# Definindo a mensagem de 32 bits no registrador r10
	movia r2, 0b1111111111001111 # Define os 16 bits menos significativos da mensagem em um registrador
	movhi r3, 0b0101100100101101 # Define os 16 bits mais significativos da mensagem em outro registrador
	add r10, r2, r3 # Junta os dois valores em apenas um registrador
	
	# Definindo o polinômio, colocando-o no registador r11
	movia r11, 0xCBF43926

deslocarBit:
	movi r2, 12

calcularCRC32:
	
	movhi r12, 0b1000000000000000 # Utilizado para identificar se o primeiro bit é 1
	bltu r10, r12, deslocarBit


	