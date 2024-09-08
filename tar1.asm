IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	var1 db 05h
	var2 dw 0ABCDh
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	lea dx,[va1]
	mov ax, 0000h
	mov ah,dx
	mov bx, 5h
	add ax, bx
	mov cx, 5h
	add ax, cx
	mov cx, [var2]
	
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


