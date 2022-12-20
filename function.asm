assume cs:code , ds:data , ss:stack

data segment
	dw 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8
	dd 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data ends

stack segment
	db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
stack ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov ax , stack
		mov ss , ax
		mov sp , 8
		mov si , 0
		mov di , 16
		mov cx , 8
	loop1:
		mov ax , ds:[si]
		call cube
		mov ds:[di] , ax
		mov ds:[di + 2] , dx
		add si , 2
		add di , 4
		loop loop1
		mov ax , 4c00h
		int 21h
		
	cube:
		mov bx , ax
		mul bx
		mul bx
		ret
		
code ends
end start