IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	arr dw 10 dup(0AAAAh)
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	mov cx,8
	mov ax,0
	mov di,1
	mov bx,10h
	lea si,[arr]
	mov [si + 12h], ax
	mov [si + 10h], di
	
Loopx:
	sub bx,2
	add ax,di
	mov [si + bx],ax
	mov ax,di
	mov di, [si + bx]
	loop Loopx

exit:
	mov ax, 4c00h
	int 21h
END start


