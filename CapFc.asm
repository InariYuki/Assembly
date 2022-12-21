assume cs:code

data segment
	db 'conservation',0,'really'
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov bx , 0
		mov cx , 19
	loop1:
		mov al , [bx]
		call upper
		inc bx
		loop loop1
	ndp:
		mov ax , 4c00h
		int 21h
		
	upper:
		and al , 11011111b
		push cx
		mov ah , 0
		mov cx , ax
		jcxz ndp
		pop cx
		mov [bx] , al
		ret
		
code ends
end start