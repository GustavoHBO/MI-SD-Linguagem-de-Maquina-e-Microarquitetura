main:
	addi r10, r0, 42 #Adiciona o valor 42 em r10
	movia r2, 0x00020014
	
	stw r10, 0(r2) #Armazena o valor 42 na posição de memória
	
	ldw r11, 0(r2) #Lê os dados da memória recém-armazenada e salva em r11
