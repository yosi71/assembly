IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	arrLe equ 5
	arr   db 3,6,5,2,1
CODESEG
	arroffset equ [bp+6]
	arrLen equ [bp+4]
	indexMin equ [bp-2]
	proc SortArray
	push bp
	mov bp,sp
	
	sub sp,2
	mov bx,arroffset ;bx = 3
	
	xor di,di ;di = 0000
SortLoop:
	call FindMin
	
	call Swap
	inc di
	cmp di,arrLen
	jl SortLoop
	
	
	add sp,2
	pop bp
	
	ret 4
	endp
	
	;findmin proc
	min equ [bp-6]
	proc FindMin
	sub sp,2
	mov al, [bx+di] ; al = 03
	cbw ; ax = 0003
	mov min, ax
	mov indexMin, di
	
	
	mov si,di ;si = 0000
FindMinLoop:
	mov al,[bx+si]
	cbw
	cmp ax, min
	jl FoundMin
	jmp ContinueFindMinLoop
	
FoundMin:
	mov indexMin,si
	mov min,ax
	
ContinueFindMinLoop:
	inc si
	cmp si,arrLen
	jl FindMinLoop
	
	add sp,2
	ret
	endp
	;Swap proc
	arrValcurrentIndex equ [bx+di]
	arrValindexMin equ [bx+si]
	proc Swap
	
	mov al, arrValcurrentIndex
	mov si, indexMin
	mov cl, arrValindexMin
	mov arrValcurrentIndex,cl
	mov arrValindexMin, al
	ret
	endp
	
	
	
	
	;main
start:
	mov ax, @data
	mov ds, ax

	push offset arr
	push arrLe
	call SortArray

	
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


