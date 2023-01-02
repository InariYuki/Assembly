assume cs:code

data segment
	db 8 , 11 , 8 , 1 , 8 , 5 , 63 , 38
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov ax , 0
		mov bx , 0
		mov cx , 8
	lo1:
		cmp byte ptr [bx] , 8
		jne ed
		inc ax
	ed:
		inc bx
		loop lo1
		mov ax , 4c00h
		int 21h
code ends
end start