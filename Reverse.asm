assume cs:code

code segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
	dw 0,0,0,0,0,0,0,0
	
start:
	mov ax, cs
	mov ss, ax
	mov ds, ax
	mov sp, 32
	
	mov bx, 0
	mov cx, 8
s:  
	push [bx]
	add bx, 2
	loop s
	
	mov bx, 0
	mov cx, 8
u:
	pop [bx]
	add bx, 2
	loop u
	
	mov ax, 4c00h
	int 21h

code ends
end start