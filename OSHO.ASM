data segment
a db 7,20,31,25,32,37
b db 6 dup(0)
data ends
code segment
assume cs:code, ds:data
start: mov ax,data
mov ds,ax
lea si,a
lea di,b
mov cl,6
do: mov al,[si]
mov ch,[si]
mov ah,0
mov dl,5
div dl
cmp ah,0
je l1
inc si
jmp l2
l1: inc si
mov [di],ch
inc di
l2: dec cl
jnz do
mov ah,4ch
int 21h

code ends
end start

