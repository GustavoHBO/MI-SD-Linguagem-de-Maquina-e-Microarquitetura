#########################################################################################################################################################
#																			#
#							Documentação - README										#
#																			#
#	- As instruções abaixo calculam o código CRC32_Q de uma mensagem qualquer.									#
#																			#
#	Registradores:																	#
#		r8  - Aponta para o topo da pilha.													#
#		r16 - Armazena a mensagem atual a ser utilizada no cálculo do CRC									#
#		r17 - Buffer de entrada das novas mensagens												#
#		r18 - Armazena o polinômio de calculo do CRC												#
#		r19 - Armazena o bit para identificação de necessidade de carry										#
#		r20 - Armazena a quantidade de bits que ainda precisam ser calculados(Tamanho da mensagem - 32 + tamanho do polinômio do CRC)		#
#		r21 - Armazena a quantidade de bits do polinômio.											#
#		r22 - Armazena a quantidade de bits a serem lidos do buffer										#
#		r23 - Aponta para o endereço de memória a ser lido											#
#																			#
#########################################################################################################################################################

#__________________________________________________________________ATENÇÂO__________________________________________________________________#
#																	    #
#	Caso deseje trocar o polinômio, altere o valor do registrador r21 para o tamanho correspondente ao polinômio.			    #
#	Caso troque a mensagem, defina a quantidade de bit's a serem calculados no registrador r20. Pode ser necessário alterar o valor	    #
#___________________________________________________________________________________________________________________________________________#

.data
	# Mensagem de 1000 bytes armazenada.
	.word 0x54D1C7AF, 0x3489B031, 0x521672AA, 0x0AE6DD1C, 0x453332C3, 0x6778E4B7, 0xB8198BEC, 0x4D4854E3, 0xFCD2FA69, 0xDC8832E9, 0x0DD2ABE5, 0x399884FB, 0xD8A76E14, 0x17F522EF, 0xCAD7DBA4, 0xDDF196DB, 0x002A09FF, 0x7DE87EA7, 0x8DF61518, 0x7F5E7C83, 0xC7A1F73E, 0x8D3C2B0F, 0x0EBF806B, 0xE00C206F, 0xC4869119, 0xD0982FA5, 0x6B323A38, 0x9D118024, 0x691FBA22, 0xE5D08DC7, 0xDD5B565C, 0xE3487313, 0x5D37F12A, 0xEA3F737B, 0xB85879DB, 0xC1B07456, 0x3C1A6758, 0xA38BB898, 0xB5D5ECDF, 0x3EFA6AAF, 0x33106E65, 0xDB8FBD36, 0x9E69B096, 0x321F6488, 0x122A7FD3, 0x8BA57841, 0x183EB984, 0xB22967F6, 0x25CBF682, 0x056A7BA6, 0x8E251293, 0x446CECE8, 0x0528BB60, 0x94A65C86, 0x533BC38C, 0x10999ED5, 0xC7458275, 0x5673CF12, 0x1DE6819D, 0x206E7BD0, 0xC92CD4CD, 0xD57EFC20, 0x6A9DDB87, 0xE5EC005B, 0x8C2BE0A2, 0x076BE4B9, 0xD297BAB5, 0x029865FE, 0x995115CC, 0xDA74744A, 0xD9A8E5B3, 0xD7148B32, 0xB3A2387A, 0x2D729CFA, 0x1E595AE2, 0xCB8816C9, 0x9479A65D, 0x393BE900, 0x318D958C, 0x520838A8, 0xA5EC2B7E, 0x352C8909, 0x5761596E, 0xCC17F9E8, 0x192C2640, 0xDF5A2FEE, 0x65600CEA, 0x93AF653D, 0x986E8385, 0x14C46466, 0x820D5BB1, 0x195CD416, 0xD5D7D6E8, 0x261EDCAC, 0xB4FED589, 0xB9322611, 0x109E8601, 0xF9D5B76A, 0x68DC1A00, 0x668BBA2A, 0x51BDAC3F, 0x1AE080E6, 0xD4669A5E, 0x8D836B85, 0xBAE8FF9F, 0xAE5F2507, 0xA0993935, 0x7FAC815A, 0xB123C6B1, 0xE6F4A1EF, 0x14FEBDC0, 0x381E7357, 0x78B2D706, 0x1E925FD1, 0xAF6339A3, 0x30E9D9BF, 0x29979C6C, 0xB4B4D700, 0xDE5BEB54, 0x1FE8ADC2, 0x65BE83CF, 0xBB8DCE4C, 0xB916E963, 0x5D059755, 0xB236DCAD, 0x78C53E2C, 0x46850769, 0xA4C44C61, 0x48C29F0F, 0x03F47097, 0xE4543093, 0x427C7E17, 0x27577D78, 0xDEFF610F, 0x453A5660, 0x215C9C78, 0xBD5A6AA3, 0x9AA9C7DE, 0x72F6FC35, 0x6B462138, 0xDE3F311B, 0x5783BFDD, 0x42156A29, 0xCF528EA5, 0x667C5169, 0xF01338F2, 0x45F75330, 0x7CF0DCB7, 0x28D518C9, 0xDFD3F3F2, 0x12CE5243, 0x4BED06C9, 0x6FD559AC, 0xBD04F84B, 0x76A99906, 0x82B42C1F, 0xED452A15, 0xB0BC30A9, 0x66759690, 0xC488FB10, 0xD545B37E, 0xBBC0111C, 0xB4CE11C2, 0x91592E63, 0x73A96313, 0x60B3B0E0, 0x43F7FA06, 0xC5138D18, 0x54338A0F, 0xE425D76C, 0xF930369D, 0x98BE8BA0, 0xB5ECD03D, 0x87387B89, 0x0404ACFD, 0x26137D61, 0x7F1CBA36, 0xD0EBCC69, 0xDB301971, 0x448A3E7C, 0x23DC63AD, 0x513BDB5D, 0xFB5ECD3B, 0xDC0B3C57, 0xF5563055, 0x1EF22DA9, 0x34754938, 0xC467B77B, 0x0B42911C, 0x5EFB2A81, 0x56171C5D, 0x5FBCEFAD, 0xFC8EFDC2, 0x9B5056BD, 0x8C052D9B, 0x65A33D76, 0xB7E118C2, 0x60FBE470, 0xD497F7E2, 0x0F138AFC, 0x33952843, 0x421AC2CA, 0x8B4361A0, 0x417C198C, 0xDD98DC8F, 0x4BBEA9DC, 0xEB0F7BEC, 0x2FC07ED0, 0x3283F944, 0x1BA0BB1F, 0x1F7A584F, 0x5C18026C, 0xB9E23803, 0x817962C3, 0x5558E78D, 0x56548A52, 0xF974458B, 0xB9F49591, 0x3BAF0C28, 0xB09BE3BC, 0x119D134B, 0x59A5EC39, 0xC1388DD5, 0x1E0EB098, 0x82504F85, 0x2726AF98, 0x69B7C611, 0xB92CDDA2, 0x49D377B5, 0x92C32E8B, 0x2333E382, 0xD38DCF10, 0xB658B4E6, 0x19DB44F1, 0x95D6D6C1, 0xE733FB8C, 0x522056A5, 0xF9C6F6FB, 0xFBF09978, 0xF952430F, 0x3A01FF3D, 0x15A32EF2, 0x644A5CCB, 0x6D24830E, 0x83A461F9, 0x22409E20, 0x4F580045, 0x7B9A55C9, 0x643AACF3, 0x4A88B580	
		
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
	add r22, r0, r0 # Define o buffer como 0 bit's carregados.
	
	ldw r16, 0(r23) # Carrega os primeiros 32 bit's na mensagem.
	
.text

	# Executa o procedimento inicial.
__main:
	call __calcularCRC32

	# Calcula o código CRC da mensagem armanenada no registrador r16 com o polinômio r18.
__calcularCRC32:
	bgeu r0, r20, __exibirCodigo # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	call __prepararMensagem # Chama o procedimento para deslocar os bit's se necessário.
	xor r16, r16, r18 # Executa o XOR da mensagem com o polinômio.
	br __calcularCRC32 # Chama novamente o procedimento de calcular CRC32.
	
	# Prepara a mensagem para que seja feita a operação XOR da mensagem com o polinômio.
__prepararMensagem:
	bge r0, r20, __exibirCodigo # Verifica se ainda existe mensagem a ser calculada. Caso r0 seja maior que r20.
	bgtu r19, r16, __deslocarBit # Verifica se o bit mais significativo da mensagem é 0. Caso r19 seja maior ou igual a r16.
	stw r31, 0(r8)
	addi r8, r8, 4 # Incrementa o ponteiro para o topo da pilha.
	call __deslocarBit
	subi r8, r8, 4 # Decrementa o ponteiro para o topo da pilha.
	ldw r31, 0(r8)
	ret
	
	# Desloca o bit mais significativo da mensagem, carregando outro no menos significativo(dependendo do valor de r7).
__deslocarBit:
	slli r16, r16, 1 # Desloca um bit para a esquerda.
	subi r20, r20, 1 # Decrementa a quantidade de bit's a serem lidos.
	addi r4, r0, 0b100000
	bgeu r20, r4, __deslocarBuffer # Verifica se os bit's a serem deslocados são da mensagem ou do polinômio.
	movia r4, 0x3FF84
	beq r8, r4, __retornar # Verifica se deve retornar a chamada da instrução call no conjuto de intruções __calcularCRC32
	br __prepararMensagem

	# Verifica se o bit a ser carregado na mensagem é 1 ou 0 e se é necessário carregar novamente o buffer.
__deslocarBuffer:
	bgeu r0, r22, __carregarMensagem # Verifica se ainda tem mensagens a serem lidas no buffer. Caso r0 seja maior ou igual a r22.
	bgtu r19, r17, __deslocarUmBit # Verifica se o bit a ser deslocado é 1 ou 0. Caso r19 seja maior que r17.
	addi r16, r16, 1
	br __deslocarUmBit

	# Desloca um bit para esquerda do buffer.
__deslocarUmBit:
	slli r17, r17, 1 # Desloca para a esquerda um bit de r17.
	subi r22, r22, 1 # Decrementa em um bit a quantidade de bit's a serem lidos do buffer.
	movia r4, 0x3FF84
	beq r8, r4, __retornar
	br __prepararMensagem
	
	# Label de retorno
__retornar:
	ret

	# Carrega a mensagem da memória para o registrador buffer.
__carregarMensagem:
	sub r20, r20, r22 # Decrementa a quantidade de bits do buffer.
	addi r23, r23, 4 # Incrementa a posição de leitura dos próximos bytes a serem recuperados da memória.
	ldw r17, 0(r23) # Ler da memória os 32 bit's.
	bgtu r21, r20, __quantidadeBitLer # Verifica se a quantidade de bit's a serem lidos na memória é menor que 32.
	addi r22, r0, 32 # Quantidade de bit's recuperados da memória.
	br __deslocarBuffer # Vai para o conjunto de instruções de deslocar bit's do buffer.

	# Determina a quantidade de bits que faltam ser calculados. Caso esse valor seja menor que 32.
__quantidadeBitLer:
	mov r22, r20
	br __deslocarBuffer # Vai para o conjunto de instruções de deslocar bit's do buffer. 
	
	# Exibe o CRC calculado nos 4 LEDs, intercalando-os com os botões. O botão mais significativo encerra o processo.
__exibirCodigo:
	mov r4, r16 # Copia o valor para r4.
	addi r5, r0, 0x840 # Define o endereço de memória no qual os botões escrevem.
	addi r6, r0, 0x8 # Define o valor no qual o botão irá escrever na memória como fim de execução.
	addi r7, r0, 0x810 # Define o endereço de memória correspondente aos LEDs.
	add r8, r0, r0 # Zera o valor de r8. Registrador que armazena o atual valor dos botões.
	addi r9, r0, 0x4 # Determina a quantidade de bit's a serem representados por vez.
	loop1: # Loop1 aguarda o botão ser pressionado.
		ldw r8, 0(r5) # Carrega a mensagem gravada pelo botão na memória em r5
		beq r8, r6, __fim # Caso o bit mais significativo da mensagem seja 1.
		bgtu r8, r0, loop2 # Caso o botão tenha sido pressionado.
		br loop1 # Retorna ao loop1.
	loop2: # Aguarda o botão ser solto
		ldw r8, 0(r5) # Carrega a mensagem gravada pelo botão na memória em r5
		beq r8, r6, __fim # Caso o bit mais significativo da mensagem seja 1.
		bgtu r8, r0, loop2 # Caso o botão não tenha sido solto.
		stw r4, 0(r7) # Grava a mensagem na posição de leitura correspondente aos LEDs.
		ror r4, r4, r9 # Desloca a mensagem à direita para exibir nos LEDs.
		br loop1 # Retorna o fluxo para o loop1.

__fim: # Fim do código.
