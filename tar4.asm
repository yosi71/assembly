IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	y db 010h
	x db 011h
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	mov bl, [x]
	cmp bl, [y]
	jl yes
	mov bl,0
	jmp exit
	
	
yes:
	mov bl,1

exit:
	mov ax, 4c00h
	int 21h
END start


