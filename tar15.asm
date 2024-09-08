IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	arr1 db 'enter 3','13','10','$'
	
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------

	mov ah,9h
	mov dx,offset arr1
	int 21h
	
	
	mov ah,1h
	mov cx,3
	
LoopInt:
	int 21h
	loop LoopInt
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


