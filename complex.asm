assume cs:code , ss:stack
;ax bx cx dx ; cs ip ; ss sp ; ds es ; si di ; bp
data segment
	db '1975' , '1976' , '1977' , '1978' , '1979' , '1980' , '1981' , '1982' , '1983' , '1984' , '1985' , '1986' , '1987' , '1988' , '1989' , '1990' , '1991' , '1992' , '1993' , '1994' , '1995' ;0-83
	dd 16 , 22 , 382 , 1356 , 2390 , 8000 , 16000 , 24486 , 50065 , 97479 , 140417 , 197514 , 345980 , 590827 , 803530 , 1183000 , 1843000 , 2759000 , 3753000 , 4649000 , 5937000 ;84-167
	dw 3 , 7 , 9 , 13 , 28 , 38 , 130 , 220 , 476 , 778 , 1001 , 1442 , 2258 , 2793 , 4037 , 5635 , 8226 , 11542 , 14430 , 15257 , 17800 ; 168-209
data ends

table segment
	db 21 dup ('year summ ne ?? ')
table ends

stack segment
	dw 0 , 0 , 0 , 0
stack ends

code segment
	start:
		mov ax , data
		mov ds , ax
		mov ax , table
		mov es , ax
		mov ax , stack
		mov ss , ax
		mov sp , 8       ;掛勾
		
		mov bx , 0
		mov cx , 21
		loop1:
			mov si , 0
			push cx
			mov cx , 4
			loop2:
				mov al , ds:[bx + si]
				mov es:[bp] , al
				mov al , ds:[bx + si + 84]
				mov es:[bp + 5] , al
				inc si
				inc bp
				loop loop2
			add bx , 4
			add bp , 12
			pop cx
			loop loop1
		mov bx , 168
		mov bp , 10
		mov cx , 21
		loop3:
			mov al , ds:[bx]
			mov es:[bp] , al
			mov al , ds:[bx + 1]
			mov es:[bp + 1] , al
			add bx , 2
			add bp , 16
			loop loop3
		mov bp , 5
		mov cx , 21
		loop4:
			mov ax , es:[bp]
			mov dx , es:[bp + 2]
			div word ptr es:[bp + 5]
			mov es:[bp + 8] , ax
			add bp , 16
			loop loop4
		mov ax , 4c00h
		int 21h
code ends
end start