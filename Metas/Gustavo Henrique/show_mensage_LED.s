movia r4, 0b11110111001100011111011100110001
movia r5, 4
loop:
	ldb r3, 0x840(r0)
	bgtu r3, r0, loop2
	br loop
	
loop2:
	ldb r3, 0x840(r0)
	bne r0, r3, loop2
	stw r4, 0x810(r0)
	ror r4, r4, r5
	br loop