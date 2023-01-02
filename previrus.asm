assume cs:code

code segment
	start:
		mov ax , cs
		mov ds , ax
		mov si , offset dbseg
		mov ax , 0
		mov es , ax
		mov di , 200h
		mov cx , offset ovend - offset dbseg
		cld
		rep movsb
		mov ax , 0
		mov es , ax
		mov word ptr es:[0 * 4] , 200h
		mov word ptr es:[0 * 4 + 2] , 0
		mov ax , 4c00h
		int 21h
		
	dbseg:
		jmp short overhead
		db "Hello virus!"
	overhead:
		mov ax , cs
		mov ds , ax
		mov si , 202h
		mov ax , 0b800h
		mov es , ax
		mov di , 12 * 160 + 36 * 2
		mov cx , 12
	s:
		mov al , [si]
		mov es:[di] , al
		inc si
		inc di
		mov al , 02h
		mov es:[di] , al
		inc di
		loop s
		mov ax , 4c00h
		int 21h
	ovend:
		nop
code ends
end start