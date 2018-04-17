####################################################################################################
#				Documentação - README
#
#	Registradores:
#		r8  - Aponta para o topo da pilha.
#		r16 - Armazena a mensagem atual a ser utilizada no cálculo do CRC
#		r17 - Buffer de entrada das novas mensagens
#		r18 - Armazena o polinômio de calculo do CRC
#		r19 - Armazena o bit para identificação de necessidade de carry
#		r20 - Armazena a quantidade de bits que ainda precisam ser calculados(Tamanho da mensagem - 32 + tamanho do polinômio do CRC)
#		r21 - Armazena a quantidade de bits do polinômio.
#		r22 - Armazena a quantidade de bits a serem lidos do buffer
#		r23 - Aponta para o endereço de memória a ser lido
#
###################################################################################################


.data
	# Mensagem de 1000 bytes armazenada.
	.word 0xe7715256, 0x267cf0f4, 0x8f85b1b2, 0x5abd25b0, 0x43f05eac, 0x91ac142e, 0xa85edec3, 0xd80019ea, 0x3f74fde3, 0xe1639fe7, 0x9e8a924c, 0xfc7f9886, 0x1e7a3bca, 0x10c81b53, 0x8d3e47b3, 0x4dd5b485, 0xc86c02f3, 0xa2ad99f2, 0x16c17077, 0xafcd141d, 0x8b453e33, 0xf7335abd, 0xffd6e0bd, 0x4a9374f1, 0xcaa302c1, 0x48b5a3e8, 0xd51ddf45, 0xcd86e764, 0x22c93ec8, 0xf553f097, 0xab08f72d, 0xcf09f3e9, 0xe9aac753, 0x669c6497, 0x901f51a9, 0xe5a3e540, 0xbdea58d7, 0xad55f394, 0x860c55aa, 0xe2570bfa, 0x67ea94bc, 0x5186f149, 0x7729a7c9, 0x80ec24d5, 0xba495b01, 0x81bc2a52, 0xa4eb6476, 0xcd37a36a, 0x3f9bebfa, 0x229fdd9f, 0xf9a582ec, 0x4958c8ee, 0xa2e26261, 0xe0c80dcb, 0x319c5752, 0x4b0a83da, 0xbd29d99b, 0xdf94386c, 0x6353c469, 0xcd49911f, 0xb4fe4f64, 0x4ecbecf8, 0xccb7ec2e, 0x4d51d4f7, 0xab6d2fbf, 0xb9f542d0, 0xb9cd0e27, 0x971c981b, 0xda20e37f, 0x6139d088, 0x7621d8d1, 0x8e7ebb40, 0x805e3a1c, 0xc0df54c3, 0x736d2b7d, 0xb00e762d, 0x6850be5e, 0xa4e845cb, 0x6a90cd46, 0xa26e1e31, 0x4013c3c0, 0x45ba65d5, 0x338ca3db, 0x6dc3cbf8, 0x1b0dc82c, 0x567ca67e, 0x3b162f1b, 0x4a2c10c5, 0x4d730cff, 0xb11b0ddc, 0xb7ecf7d7, 0xa78788dc, 0x1ed75adb, 0x156d41a8, 0x586d5726, 0x6357b5e7, 0x1752b36c, 0x69e6132f, 0x78eb41a6, 0x5e302298, 0xd6d848c2, 0x548f26fd, 0x5611dc88, 0x588b5614, 0x19481ade, 0x57ea68a4, 0xceb67791, 0x2c350b9f, 0xfe97bc50, 0x91d70d30, 0xb95268cd, 0xae3393ff, 0x55ccc5f4, 0x64a176a4, 0x7905f948, 0x15b6bcc3, 0xf7eaf1b7, 0x7fb66549, 0x9097649a, 0xa07bbc6f, 0x930829bf, 0x626379d5, 0x26a4f7cf, 0x38f6d477, 0xba9982df, 0x9a905550, 0x7c249e43, 0xda018756, 0x2a9c8127, 0x9e0c08b3, 0x5641351d, 0xfeafaa68, 0x52c8b68b, 0x7c60e3f6, 0xe59dbcdf, 0x1f2054c9, 0x49dba819, 0x417ed5d8, 0xa9c97cad, 0xd791da26, 0x74f7310f, 0x70fa95c6, 0x43d425d9, 0x6253efeb, 0x9ce4903d, 0x4141128e, 0xf14f3670, 0x76a2bad0, 0xc80b96b9, 0xf402cbdd, 0x1ffbdf53, 0xbe864703, 0xc6968d6f, 0x6ed2229f, 0x32e59fec, 0x81e5cb05, 0xe4eaba2d, 0x46402a6f, 0xc53decd7, 0xfb5b9b7b, 0xdf984014, 0x3b52e7b1, 0xf7379b70, 0x9deb6ddc, 0x5eabe2e1, 0xa24f0f45, 0x47f4e797, 0x8152a7a5, 0x5a152efe, 0xb654b27a, 0x34acb14d, 0xeeb3539b, 0x51cf5e04, 0xf84f4d8f, 0x756baecd, 0x3c9313e4, 0xc25366d4, 0x225b9ef8, 0x3205eb21, 0x2c7b2b3f, 0xbf8053ba, 0x8f0b0c5c, 0x95629f2e, 0xd7ea7d43, 0x77c0c15b, 0xde676972, 0xc5dee9ca, 0xdf31ea0c, 0xc0e076a0, 0xfaf5ecc9, 0x9cc6a18f, 0x6557f8bc, 0x22cd11e7, 0x2bbc841e, 0x8aaa1656, 0x38e5beb9, 0x2ddadfc4, 0x105e34f1, 0xc8b1e795, 0x3191d45c, 0xad862810, 0xb5287f0a, 0x5e686216, 0xbd612056, 0x8422d12c, 0x8a10211f, 0x7dc4dbb6, 0x57d8a3ce, 0xf34bc7ae, 0x60adc4ac, 0xd6383e4e, 0x3dc6886b, 0x543419dd, 0xb0f4074a, 0x4bb6b398, 0x438c3534, 0x4f336574, 0x56005d9d, 0xfcf11652, 0x79944ded, 0x4bb0a381, 0x5bc602b9, 0x903b9cbb, 0x499ccb16, 0x6c96a329, 0x3aa48156, 0xd97eae81, 0xa537c766, 0x5b94cb38, 0x1b0b79e6, 0x8ff9404b, 0xc100b246, 0x6ab716f2, 0x3391ebb9, 0x29c2c4ac, 0x4a9fc2a2, 0xf5362fa7, 0x58181684, 0x79c0d72e, 0xf2a92bd0, 0x447a9073, 0x1fdbde68, 0xc4f82b8f, 0xc6b33f6c, 0x8acc3182, 0x6665c5ff, 0x1e8ca7c4, 0xa2e6d30e, 0x367bce1d
		
		# Declaração dos valores a serem utilizados
	
	# Definindo o topo da pilha
	movia r8, 0x3FF80

	# Definindo o polinômio, colocando-o no registador r18
	movia r18, 0x814141AB
	
	# Utilizado para identificar se o primeiro bit é 1
	movhi r19, 0b1000000000000000 
	
	# Define a quantidade de bits que ainda precisam ser calculados(Tamanho da mensagem - 32 + tamanho do polinômio do CRC)
	addi r20, r0, 8000
	
	# Define a quantidade de bits do polinômio
	addi r21, r0, 32
	
	# Carrega os registradores de mensagem e buffer a partir da memória.
	
	movia r23, 0x30000 # Define o endereço inicial de leitura.
	addi r22, r0, 32 # Define o buffer com tamanho 32.
	
	ldw r16, 0(r23)
	addi r23, r23, 4
	ldw r17, 0(r23)
.text

__main:
	call __calcularCRC32
	br __fim

__calcularCRC32:
	
	bgt r0, r20, __fim # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	call __prepararMensagem # Chama o procedimento para deslocar os bit's se necessário.
	xor r16, r16, r18 # Executa o XOR da mensagem com o polinômio.
	br __calcularCRC32 # Chama novamente o procedimento de calcular CRC32.
	
__prepararMensagem:
	bgt r0, r20, __fim # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	bgeu r19, r16, __deslocarBit # Verifica se o bit mais significativo da mensagem é 0. Caso r19 seja maior ou igual a r16.
	stw r31, 0(r8)
	addi r8, r8, 4 # Incrementa o ponteiro para o topo da pilha.
	call __deslocarBit
	subi r8, r8, 4 # Decrementa o ponteiro para o topo da pilha.
	ldw r31, 0(r8)
	ret
	
__deslocarBit:
	slli r16, r16, 1 # Desloca um bit para a esquerda.
	subi r20, r20, 1 # Decrementa a quantidade de bit's a serem lidos.
	bgtu r20, r22, __deslocarBuffer # Verifica se os bit's a serem deslocados são da mensagem ou do polinômio.
	movia r4, 0x3FF84
	beq r8, r4, __retornar
	br __prepararMensagem

__deslocarBuffer:
	mov r4, r0
	addi r4, r0, 0b1000000
	bgeu r0, r4, __carregarMensagem # Verifica se ainda tem mensagens a serem lidas no buffer. Caso r0 seja maior ou igual a r22.
	bgtu r19, r17, __deslocarUmBit # Verifica se o bit a ser deslocado é 1 ou 0. Caso r19 seja maior que r17.
	addi r16, r16, 1
	slli r17, r17, 1 # Desloca para a esquerda um bit de r17.
	subi r22, r22, 1 # Decrementa em um bit a quantidade de bit's a serem lidos do buffer.
	movia r4, 0x3FF84
	beq r8, r4, __retornar
	br __prepararMensagem

__deslocarUmBit:
	slli r17, r17, 1 # Desloca para a esquerda um bit de r17.
	subi r22, r22, 1 # Decrementa em um bit a quantidade de bit's a serem lidos do buffer.
	movia r4, 0x3FF84
	beq r8, r4, __retornar
	br __prepararMensagem

__retornar:
	ret

__carregarMensagem:
	sub r20, r20, r22 # Decrementa a quantidade de bits do buffer.
	addi r23, r23, 4 # Incrementa a posição de leitura dos próximos bytes a serem recuperados da memória.
	ldw r17, 0(r23) # Ler da memória os 32 bit's.
	bgtu r21, r20, __quantidadeBitLer # Verifica se a quantidade de bit's a serem lidos na memória é menor que 32.
	addi r22, r0, 32 # Quantidade de bit's recuperados da memória.
	br __deslocarBuffer # Vai para o conjunto de instruções de deslocar bit's do buffer.

__quantidadeBitLer:
	mov r22, r20
	br __deslocarBuffer # Vai para o conjunto de instruções de deslocar bit's do buffer. 

__fim:
