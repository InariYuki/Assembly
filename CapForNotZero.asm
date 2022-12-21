assume cs:code

data segment
	db 'word',0,'unix',0,'wind',0,'good',0
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov bx , 0
		mov cx , 20
	loop1:
		mov al , [bx]
		call cap
		mov [bx] , al
		inc bx
		loop loop1
		mov ax , 4c00h
		int 21h
		
	cap:
		push cx
		mov cl , al
		mov ch , 0
		jcxz nd
		and al , 11011111b
		jmp nd
	nd:
		pop cx
		ret
		
code ends
end start