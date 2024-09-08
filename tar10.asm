IDEAL
MODEL small
STACK 20h
DATASEG
; --------------------------
; Your variables here
; --------------------------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	mov ax,1234h
	push ax
	pop ax
	push 5678h
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


