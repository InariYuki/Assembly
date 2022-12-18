assume cs:code
code segment
	start:
		mov ax , 2000h
		mov ds , ax
		mov bx , 0
	s:
		mov al , [bx]
		mov ah , 0
		mov cx , ax
		jcxz p
		inc bx
		jmp short s
	p:
		mov dx , bx
		mov ax , 4c00h
		int 21h
code ends
end start