
data  segment 
divd dw 0105h
divsr db 15h
result  db ?,?  
data  ends

code segment
assume cs:code, ds:data
start: mov ax, data
	mov ds, ax
	mov ax,divd
	div divsr
	mov result, al
	mov result+ 1, ah
	mov ah, 4ch
	int 21h
	code ends
	end start
