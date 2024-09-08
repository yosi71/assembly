IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	nick db "tomernaim" ;74 6F 6D 65 72 6E 61 69 6D
	nickmask dw 1000100010001000b ;8888
	nickdec dw 6 dup (?)
	nickenc dw 6 dup (?)
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	lea bx,[nick]
	
	;encrypt
	mov ax,bx ;ax = 74h = 0111 0100
	xor ax,[nickmask]	;
	mov ax,[nickenc]
	
	mov ax,[bx+1]
	xor ax,[nickmask]
	mov ax,[nickenc+1]
	
	mov ax,[bx+2]
	xor ax,[nickmask]
	mov ax,[nickenc+2]
	
	mov ax,[bx+3]
	xor ax,[nickmask]
	mov ax,[nickenc+3]
	
	mov ax,[bx+4]
	xor ax,[nickmask]
	mov ax,[nickenc+4]
	
	mov ax,[bx+5]
	xor ax,[nickmask]
	mov ax,[nickenc+5]
	
	mov ax,[bx+6]
	xor ax,[nickmask]
	mov ax,[nickenc+6]
	
	mov ax,[bx+7]
	xor ax,[nickmask]
	mov ax,[nickenc+7]
	
	;decrypt
	mov ax,[nickenc]
	xor ax,[nickmask]
	mov ax,[nickdec]
	
	mov ax,[nickenc+1]
	xor ax,[nickmask]
	mov ax,[nickdec+1]
	
	mov ax,[nickenc+2]
	xor ax,[nickmask]
	mov ax,[nickdec+2]
	
	mov ax,[nickenc+3]
	xor ax,[nickmask]
	mov ax,[nickdec+3]
	
	mov ax,[nickenc+4]
	xor ax,[nickmask]
	mov ax,[nickdec+4]
	
	mov ax,[nickenc+5]
	xor ax,[nickmask]
	mov ax,[nickdec+5]
	
	mov ax,[nickenc+6]
	xor ax,[nickmask]
	mov ax,[nickdec+6]
	
	mov ax,[nickenc+7]
	xor ax,[nickmask]
	mov ax,[nickdec+7]
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


