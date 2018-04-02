.data
	movhi r3, 0b1100010110001101
	movia r4, 0x3ff80
	
	stw r3, 0(r4)
	ldw r5, 0(r4)