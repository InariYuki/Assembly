assume cs:code , ds:data

data segment
	db 'BaSiC'
	db 'iNfOrMaTiOn'
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		
		mov bx , 0
		
		mov cx , 16
		lo:
			mov al , [bx]
			or al , 00100000b
			mov [bx] , al
			inc bx
			loop lo
		mov ax , 4c00h
		int 21h
code ends
end start