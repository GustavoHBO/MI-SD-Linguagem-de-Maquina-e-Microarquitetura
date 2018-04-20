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
	.word 0x6A92FD57, 0x48DAB0A1, 0x9BC8220E, 0xC6BE7975, 0xF50CF9B9, 0x4E1E541E, 0x51614047, 0x03BD9604, 0xDF9919A7, 0x7B0B247F, 0xFFEA9CC3, 0x41B62224, 0xA7A71587, 0xE0D4CCE1, 0xE41A93EA, 0x4140C7D4, 0x13E03024, 0xB78B92C7, 0x8F505A6E, 0x9E5E255A, 0x79339A7B, 0x2D778D3D, 0x8DE3FCF5, 0x085E7B19, 0x1F17A461, 0x424689E1, 0xA39CF261, 0x925FCBD8, 0xA8711739, 0x71565019, 0x5335CF40, 0x5902CCBD, 0xFA310458, 0xE86F0D83, 0xF8EFC364, 0x27D494C4, 0x80CF0801, 0x8B63D526, 0x85CE2FD2, 0x8345B356, 0xF158CD15, 0x5A5DDB0F, 0x0CEA6A58, 0x22669C41, 0xBA143E52, 0x9132A675, 0xABC15A66, 0xC135623F, 0x4973BF83, 0xA3DC665F, 0xD0761E96, 0x66F58199, 0xD0FCF769, 0x42128531, 0x7C88921C, 0x814E01E7, 0x3D5C3FD0, 0x17BD99CA, 0x3ABE1977, 0xD1EDB66D, 0x700BDDA6, 0xD0E2BC6A, 0x632D99FA, 0xE89342B0, 0x9471F614, 0x35E21F7D, 0x3BEC3BAF, 0x6C0FBAB2, 0x5D7A6066, 0xD5E776B3, 0x04ED7D6C, 0xF419B8C4, 0x1BC7FA4D, 0x51266FCD, 0x5E95B03E, 0x3911ED01, 0xF3CFE1A8, 0x755A0D87, 0x1B658E0A, 0x9091C0F6, 0x77A0C4E9, 0xF07F030C, 0x9A451B2C, 0xE7E76F42, 0x47A0D38E, 0xB79A457F, 0x15DDC46D, 0x92066DAA, 0x003F3457, 0xD89CBAED, 0x33C07F9C, 0xCB55ECB6, 0xF996961F, 0xD1DDDE20, 0xAD1E4722, 0x49E6858F, 0x936B7772, 0x2DC29AA2, 0xCE3766C9, 0xF799FB42, 0x179AD7BC, 0xE33D5A53, 0xF00FF2A2, 0xA3D6471D, 0xD2BE25A5, 0x36A4D69B, 0x96BC4316, 0x988B53A9, 0xAA81DC6D, 0xB2DA8F4D, 0x64E2BDA9, 0x217F3A87, 0x98B2FF85, 0xA474D2D8, 0xD6B78896, 0x37FC0EF3, 0x30EC206F, 0xF30089BC, 0xD1B12F84, 0x27229680, 0xF808F32F, 0xD2E1E7F9, 0xD6369AE4, 0x1424DE6B, 0x43A1E47D, 0x285D15E5, 0xD63E903F, 0x4BC2BD42, 0x17F63525, 0xB3376EA7, 0xBC410BD4, 0xC28B2F89, 0x4D822C77, 0x3F5E2A33, 0x3BACB675, 0xF87FEB72, 0xED93AFD7, 0xEE53A08B, 0xCA79FDCE, 0x23B1A704, 0x5D17FBB5, 0xE56020F3, 0xE47C27FE, 0x44F2E773, 0x44392BAE, 0x745C9C88, 0xAEA5D873, 0xEAFBFEA8, 0xCA524817, 0xF76B0388, 0x9D7247F3, 0xD0EACC81, 0xE723E038, 0xC16B1654, 0xCD060B85, 0xEB51414B, 0x5FF2BDAE, 0x96B0FF8F, 0x9AF378BA, 0xEB6FB2DA, 0xE548274F, 0x61D73B29, 0xA20BCC67, 0xCCA52D4E, 0x4550940D, 0xAE31CDB2, 0xECBFAF70, 0xC2AC8C2E, 0x475B66FC, 0xB731D292, 0x693749E4, 0xB50AA07A, 0xEB06BE22, 0xBEC5BDD5, 0x85BF78BE, 0x2AC8C203, 0x9D9ACC78, 0x39F40D89, 0xBB655338, 0xBC4F9DC9, 0x7F321075, 0xF4B32F3F, 0x17FD80C3, 0xA74C61AA, 0xCEC8D535, 0x9C03DB59, 0xE4406450, 0xB623767A, 0x2EC3D623, 0x24E14A48, 0x41464211, 0x3984E473, 0x2016DFD0, 0xC0713D00, 0x0AB1545E, 0xEB1B7204, 0x56B3975E, 0xFA5AC84C, 0x458FA62A, 0xDF30143C, 0xA98F58B8, 0x73D85B06, 0x24504149, 0x1DBAB616, 0xF7059685, 0x88430FBA, 0x384D1DDE, 0x6D36D61B, 0xCB65C202, 0xCBCFD45F, 0x99BAA09B, 0x56BE2BD5, 0xAFF007B9, 0x77A490EF, 0x61D3B68C, 0xBF773C9C, 0xADC80880, 0x12BD80EC, 0x461CF98F, 0x69D9DE19, 0x4BBDC296, 0x6F3D45F8, 0xA01EC778, 0xF43A0315, 0x44143B52, 0x7848DDEF, 0x1113E7FB, 0x0DC7E688, 0xBC69C973, 0x24D5DCFB, 0xCB28BF2E, 0x9E62DD40, 0x33BE5EDE, 0x7E55912E, 0x42AA71A7, 0x4F2C4B47, 0x9C9697A8, 0x40E31E06, 0x937091C1, 0x90C853C9, 0x805C1067, 0xF558FBB0, 0x770869BE, 0x37A846D7, 0x2DF52422, 0x9B234D0B, 0xEA36AEF5, 0xF384D654, 0x876F96A8, 0xC93CF1FE
	
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
	
	ldw r16, 0(r23) # Carrega os primeiros 32 bit's na mensagem.
	addi r23, r23, 4
	ldw r17, 0(r23) # Carrega mais 32 bit's no buffer.
.text

__main:
	call __calcularCRC32

__calcularCRC32:
	
	bgeu r0, r20, __exibirCodigo # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	call __prepararMensagem # Chama o procedimento para deslocar os bit's se necessário.
	xor r16, r16, r18 # Executa o XOR da mensagem com o polinômio.
	br __calcularCRC32 # Chama novamente o procedimento de calcular CRC32.
	
__prepararMensagem:
	bgt r0, r20, __exibirCodigo # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	bgtu r19, r16, __deslocarBit # Verifica se o bit mais significativo da mensagem é 0. Caso r19 seja maior ou igual a r16.
	stw r31, 0(r8)
	addi r8, r8, 4 # Incrementa o ponteiro para o topo da pilha.
	call __deslocarBit
	subi r8, r8, 4 # Decrementa o ponteiro para o topo da pilha.
	ldw r31, 0(r8)
	ret
	
__deslocarBit:
	slli r16, r16, 1 # Desloca um bit para a esquerda.
	subi r20, r20, 1 # Decrementa a quantidade de bit's a serem lidos.
	addi r4, r0, 0b100000
	bgeu r20, r4, __deslocarBuffer # Verifica se os bit's a serem deslocados são da mensagem ou do polinômio.
	movia r4, 0x3FF84
	beq r8, r4, __retornar # Verifica se deve retornar a chamada da instrução call no conjuto de intruções __calcularCRC32
	br __prepararMensagem

__deslocarBuffer:
	bgeu r0, r22, __carregarMensagem # Verifica se ainda tem mensagens a serem lidas no buffer. Caso r0 seja maior ou igual a r22.
	bgtu r19, r17, __deslocarUmBit # Verifica se o bit a ser deslocado é 1 ou 0. Caso r19 seja maior que r17.
	addi r16, r16, 1
	br __deslocarUmBit

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
	
__exibirCodigo:
	mov r4, r16 # Copia o valor para r4.
	addi r5, r0, 0x840
	addi r6, r0, 0x10
	addi r7, r0, 0x810
	loop1:
		ldw r8, 0(r5)
		bgtu r8, r0, loop2
		br loop1
	loop2:
		ldw r8, 0(r5)
		bgtu r8, r0, loop2
		roli r4, r4, 0x4
		stw r4, 0(r7)
		br loop1

__fim:
