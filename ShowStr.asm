assume cs:code    ;8行3列顯示綠色字

data segment
	db 'welcome to masm' , 0
data ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov si , 0
		mov dh , 8 ;第8行
		mov dl , 3 ;第3列
		mov cl , 00000010b ;Brgbirgb
		mov ax , 0b800h
		mov es , ax
		call show_str
		mov ax , 4c00h
		int 21h
		
	show_str:
		mov al , 2
		mul dh
		mov bx , ax
		mov al , 160
		mul dl
		add bx , ax
		mov di , bx
		
code ends
end start