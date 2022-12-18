assume cs:code , ds:data , ss:stack

data segment
	db '1. display......'
	db '2. blows........'
	db '3. replace......'
	db '4. modify.......'
data ends

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

code segment
start:
	mov ax , data
	mov ds , ax
	mov ax , stack
	mov ss , ax
	mov sp , 16
	mov bx , 3
	mov cx , 4
	loop1:
		push cx
		mov si , 0
		mov cx , 4
		loop2:
			mov al , [bx + si]
			and al , 11011111b
			mov [bx + si] , al
			inc si
			loop loop2
		pop cx
		add bx , 16
		loop loop1
	mov ax , 4c00h
	int 21h
code ends
end start