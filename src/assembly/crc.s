####################################################################################################
#				Documentação - README
#
#	Registradores:
#		r10 - Armazena a mensagem atual a ser utilizada no cálculo do CRC
#		r11 - Armazena o polinômio de calculo do CRC
#		r12 - Armazena o bit para identificação de necessidade de carry
#		r13 - Armazena a quantidade de bits que ainda precisam ser calculados(Tamanho da mensagem - 32 + tamanho do polinômio do CRC)
#		r14 - Buffer para ser carregado na mensagem
#		r15 - Tamanho do polinômio
#
###################################################################################################



# Declaração dos valores a serem utilizados
data:
	# Definindo a mensagem de 32 bits no registrador r10
	#movia r2, 0b1111111111001111 # Define os 16 bits menos significativos da mensagem em um registrador
	#movhi r3, 0b0101100100101101 # Define os 16 bits mais significativos da mensagem em outro registrador
	#add r10, r2, r3 # Junta os dois valores em apenas um registrador
	movia r10, 0x592DFFCF
	movia r14, 0x0
	
	# Definindo o polinômio, colocando-o no registador r11
	movia r11, 0x04C11DB7
	
	# Utilizado para identificar se o primeiro bit é 1
	movhi r12, 0b1000000000000000 
	
	# Define a quantidade de bits que ainda precisam ser calculados(Tamanho da mensagem - 32 + tamanho do polinômio do CRC)
	movia r13, 32
	
	movia r15, 32

__main:
	call __calcularCRC32

__calcularCRC32:
	
	bgtu r0, r13, __fim
	bltu r10, r12, __deslocarBit
	slli r10, r10, 1 # Faz o carry de apenas um bit
	subi r13, r13, 1 # Subtrai em 1 a quantidade de bits a serem calculados
	xor r10, r10, r11
	call __calcularCRC32
	
__deslocarBit:
	slli r10, r10, 1 # Faz o carry de apenas um bit
	subi r13, r13, 1 # Subtrai em 1 a quantidade de bits a serem calculados
	bltu r15, r13, __deslocarBitMensagem
	bgtu r13, r0, __calcularCRC32
	call __fim
	
__deslocarBitMensagem:
	bltu r14, r12, __calcularCRC32
	addi r10, r10, 1
	
__fim:
