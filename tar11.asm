IDEAL
MODEL small
STACK 20h
DATASEG
; --------------------------
; Your variables here
; --------------------------
	rip dw ?
	max dw ?
	min dw ?
CODESEG
proc Check4
	pop [rip]
	pop ax
	mov [max], ax
	mov [min], ax
Loopx:
	pop ax
	cmp ax, [max]
	jg Bigger
	cmp ax, [min]
	jl Smaller
Bigger:
	mov [max], ax
	jmp Continue
Smaller:
	mov [min], ax
	jmp Continue
Continue:
	loop Loopx
	push [rip]
	ret
end Check4
start:
	mov ax, @data
	mov ds, ax
	push 2
	push -5
	push -4
	push 1
	mov cx,3
	call Check4
	 
	
exit:
	mov ax, 4c00h
	int 21h
END start


