.data
	# Definindo a mensagem de 32 bits
	movia r2, 0b1111111111001111 # Define os 16 bits menos significativos da mensagem
	movhi r3, 0b0101100100101101
	add r10, r2, r3