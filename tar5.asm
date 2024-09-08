IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	x db 10000001b
	y db 10000000b
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	xor ah, ah
	mov al, [x]
	mov [y + 1],0
	cmp al,[y]
	jg Bigger
	sub ax, [word ptr y]
	jmp exit
	
Bigger:
	add ax, [word ptr y]
	
exit:
	mov ax, 4c00h
	int 21h
END start


