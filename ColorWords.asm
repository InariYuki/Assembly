;print welcome to masm   B r g b i r g b   ax bx cx dx , cs ip , ss sp , ds es , si di , bp
assume cs:code , ds:data , ss:stack
;b8000-b8F9f      b8720-b873f   b87c0-b87df  b8860-b887f
data segment
	db 'welcome to masm!'
	db 02h , 00100100b , 01110001b
data ends

stack segment
	dw 8 dup(0)
stack ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov ax , stack
		mov ss , ax
		mov sp , 16
		mov ax , 0b872h
		mov es , ax
		mov si , 16 ;color
		mov cx , 3
	loop2:
		mov ah , ds:[si]
		mov bx , 0  ;text
		mov di , 0  ;display
		push cx
		mov cx , 16
	loop1:
		mov al , [bx]
		mov es:[di] , al
		mov es:[di + 1] , ah
		add di , 2
		inc bx
		loop loop1
		mov ax , es
		add ax , 0ah
		mov es , ax
		pop cx
		inc si
		loop loop2
		mov ax , 4c00h
		int 21h
code ends
end start