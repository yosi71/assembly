IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	arr db ?
CODESEG
	proc isDigit
	push bp
	mov bp, sp
	xor bl, bl
	xor dx, dx
	push ax
	sub ax, '0'
DigitLoop:
	cmp ax, dx
	jne ContinueDigitLoop
	mov bl, 1h
	jmp BreakDigitLoop
ContinueDigitLoop:
	inc dx
	cmp dx, 10
	jne DigitLoop
BreakDigitLoop:
	pop ax
	pop bp
	ret
	endp isDigit
	
start:
	mov ax, @data
	mov ds, ax
	mov es, ax
	cld
	mov cx, 2
	mov di, offset arr
inputLoop:
	mov ah,1h
	int 21h
	cbw
	call isDigit
	cmp bl, 0
	je exit
	stosb
	loop InputLoop
	mov di, offset arr
	mov di, offset arr
	mov ah, 2h
    mov dl, 0ah
	int 21h
    mov dl, 0dh
    int 21h
	mov al, [di]
	sub al, [di+1]
	cmp al, 0
	jge PrintWhoIsBigger
	cbw
	mov ah, 2h
	push ax
	mov dl, '-'
	int 21h
	pop ax
	neg al
PrintWhoIsBigger:
	mov dl, al
	add dl, '0'
    int 21h


exit:
	mov ax, 4c00h
	int 21h
END start


