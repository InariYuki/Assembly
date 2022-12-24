assume cs:code ; 0x31-0x39 = 1 - 9     addr = 0xb8000 , color = 2 , 3 row 8 col

data segment
	dw 123 , 12666 , 1 , 8 , 3 , 38
	dw 0 ;12
data ends

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

code segment
	start:
		mov ax , data
		mov ds , ax 
		mov si , 0 ;掛勾ds跟data
		mov ax , stack
		mov ss , ax
		mov sp , 16 ;掛勾ss跟stack
		mov ax , 0b800h ;顯存地址
		mov es , ax 
		mov di , 496 ;開始地址
		call DisplayDec
		mov ax , 4c00h
		int 21h
		
	DisplayDec:
		mov cx , 6
	lo3:
		mov ax , 1
		mov bp , 12
		mov ds:[bp] , ax
		mov ax , ds:[si]
		mov bx , 10
		push cx
		mov cx , 5
	lo1:
		mov dx , 0
		div bx
		push dx
		push cx
		mov cx , ax
		jcxz ot
		mov dx , ds:[bp]
		inc dx
		mov ds:[bp] , dx
		pop cx
		loop lo1
	ot:
		pop cx
		mov cx , ds:[bp]
	lo2:
		pop bx
		add bx , 30h
		mov es:[di] , bx
		mov al , 2
		mov es:[di + 1] , al
		add di , 2
		loop lo2
		pop cx
		add si , 2
		loop lo3
		ret
		
code ends
end start