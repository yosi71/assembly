IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	arr dw 5 ?
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	mov di,0
	lea bx,[arr]
	
Loopx:
	mov ah, 1h
	int 21h
	cbw
	mov [bx + di], ax
	inc di
	cmp di,5
	jne Loopx
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


