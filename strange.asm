assume cs:code

code segment
	mov ax , 4c00h
	int 21h
	start:
		mov ax , 0
	s:
		nop
		nop
		mov di , offset s             ;ax=s2 addr di = s addr si = s2 addr 
		mov si , offset s2            ;s addr = s2 addr
		mov ax , cs:[si]
		mov cs:[di] , ax
	s0:
		jmp short s
	s1:
		mov ax , 0
		int 21h
		mov ax , 0
	s2:
		jmp short s1
		nop
code ends
end start