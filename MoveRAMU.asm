assume cs:code

code segment

	mov ax, 0ffffh
	mov ds, ax
	mov ax, 20h
	mov es, ax
	mov bx, 0
	mov cx, 12
s:  
	mov dl, [bx]
	mov dh, 0
	mov es:[bx], dx
	inc bx
	loop s
	
	mov ax, 4c00h
	int 21h

code ends
end