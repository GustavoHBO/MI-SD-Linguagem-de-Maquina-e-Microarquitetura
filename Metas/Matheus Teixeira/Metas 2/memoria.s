main:
	addi r10, r0, 42 #Adiciona o valor 42 em r10
	movia r2, 0x00020014
	
	stw r10, 0(r2) #Armazena o valor 42 na posi��o de mem�ria
	
	ldw r11, 0(r2) #L� os dados da mem�ria rec�m-armazenada e salva em r11
