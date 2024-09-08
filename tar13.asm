IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	var1 dw 4h
	var2 dw 5h
	var3 dw 6h
CODESEG
	;parm
	v1 equ [bp+8]
	v2 equ [bp+6]
	v3 equ [bp+4]
	;local
	p1 equ [bp-6]
	p2 equ [bp-4]
	p3 equ [bp-2]
proc XYZ
	push bp
	mov bp,sp
	sub sp,6
	push ax
	mov ax,v1
	mov p1,ax
	mov ax,v2
	mov p2,ax
	mov ax,v3
	mov p3,ax
	
	pop ax
	add sp,6
	pop bp
	ret 6
	endp XYZ

start:
	mov ax, @data
	mov ds, ax
	push [var1]
	push [var2]
	push [var3]
	call XYZ
	
	
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


