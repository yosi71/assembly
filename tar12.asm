IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	var1 dw 4
	var2 dw 5
	max dw ?
CODESEG
	proc SimpleAdd
	push bp
	mov bp,sp
	
	mov ax,[bp+6]
	mov cx, [bp+4]
	
	mov bx, [bp+8]
	cmp ax,cx
	jg Axbigger
	mov [bx],cx
	jmp continue
Axbigger:
	mov [bx],ax
continue:
	pop bp
	ret 6
	endp SimpleAdd
start:
	mov ax, @data
	mov ds, ax
	push offset max
	push var1
	push var2
	call SimpleAdd
	
	


exit:
	mov ax, 4c00h
	int 21h
END start


