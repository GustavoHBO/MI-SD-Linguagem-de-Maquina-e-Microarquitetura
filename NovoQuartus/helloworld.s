.equ leds, 0x3000
.global _start 
_start: 
movia r3, leds
movi r4, 0b1010

stw r4, 0(r3)
end:
br end
.end