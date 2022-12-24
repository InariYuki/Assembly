assume cs:code ;1000/1 商 餘數

data segment
	dw 1000 ;0 1
	db 1 ;2
	dw 0 ;3 4
	db 0 ;5
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov si , 0
		call divdx
		mov ax , 4c00h
		int 21h
		
	divdx:
		mov al , [si + 1]
		mov ah , 0
		mov bl , 1
		div bl
		mov ch , al ;商放在ch
		mov cl , ah ;餘數放在cl
		mov bx , 100h
		mov ah , 0
		mul bx
		push ax ; 低位入stack
		push dx ; 高位入stack
		mov al , cl
		mov ah , 0
		mul bx
		mov cx , [si]
		mov ch , 0
		add ax , cx
		pop dx
		pop dx
		add ax , dx
		mov [si + 3] , ax
		ret
code ends
end start