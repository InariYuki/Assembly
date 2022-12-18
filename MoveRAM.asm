assume cs:code

code segment

	mov bx, 0
	mov cx, 12
s:  
	mov ax, 0ffffh
	mov ds, ax
	mov al, [bx]
	mov ah, 0
	mov dx, 20h
	mov ds, dx
	mov [bx], ax
	inc bx
	loop s
	
	mov ax, 4c00h
	int 21h

code ends
end