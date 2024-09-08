IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	str1 db "123321" ;a
	lenstr1 db $-str1 ;b
CODESEG
start:
	mov ax, @data
	mov ds, ax
	mov si,str1
	mov di,lenstr1
	dec lenstr1
	jmp Whilecondition
	
whilepandrom:
	std
	lodsb
	cld
	scasb
	jne nopolidrom
Whilecondition:
	cmp str1,lenstr1
	jb whilepandrom
	mov ah,1
	
nopolidrom:
	mov ah,0


exit:
	mov ax, 4c00h
	int 21h
END start


