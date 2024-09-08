IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	TimesToPrintX db ?
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	mov [TimesToPrintX],5
	mov cl,[TimesToPrintX]
	cmp cl,0
	jg Loopx
	jle Errx
	
	
Loopx:
	mov dl,'x'
	mov ah, 2h
	int 21h
	dec cl
	cmp cl, 0
	jg Loopx
	jmp exit
	
Errx:
	mov dl, 'e'
	mov ah,2h
	int 21h
exit:
	mov ax, 4c00h
	int 21h
END start


