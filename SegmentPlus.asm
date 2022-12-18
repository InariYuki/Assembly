assume cs:code , ds:b , es:ca
; ax bx cx dx ; cs ip ; ss sp ; ds ; es
a segment
	db 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8
a ends

b segment
	db 8 , 7 , 6 , 5 , 4 , 3 , 2 , 1
b ends

ca segment
	db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
ca ends

code segment
	start:
		mov ax , b
		mov ds , ax
		mov ax , ca
		mov es , ax
		mov bx , 0
		mov cx , 8
		fo:
			mov ax , [bx]
			mov es:[bx] , ax
			add bx , 2
			loop fo
		mov ax , a
		mov ds , ax
		mov bx , 0
		mov cx , 8
		fo2:
			mov ax , [bx]
			add es:[bx] , ax
			add bx , 2
			loop fo2
		
		mov ax , 4c00h
		int 21h
code ends
end start