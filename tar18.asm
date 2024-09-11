IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	
CODESEG
start:
	mov ax, @data
    mov ds, ax
	xor cx, cx
	xor dx,dx
inputtav:
	mov ah,1
	int 21h
	sub al,30
	cbw
	push cx
	xor cx, cx
isDigit:
	cmp ax,cx
	jne continueIn
	mov dl, 1
	jmp continueOut
continueIn:
	inc cx
	cmp cx, 10
	jne isDigit
	
continueOut:
	cmp dl,0
	je NotDigit
	xor dh,dh
	add dl,al
	pop cx
	cmp cx,10
	jne inputtav
	jmp exit
	
	

	
	
NotDigit:
	xor dl,dl

exit:
	mov ax, 4c00h
	int 21h
END start


