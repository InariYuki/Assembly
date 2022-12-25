assume cs:code ; calculate 0x1ef000 + 0x201000 = ax-high 16 bit bx-low 16 bit

code segment
	start:
		mov ax , 0f000h
		add ax , 1000h
		mov bx , ax
		mov ax , 1eh
		adc ax , 20h
		mov ax , 4c00h
		int 21h
code ends
end start