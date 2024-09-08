IDEAL
MODEL small
STACK 100h
DATASEG

    table1   db "abcdefghijklmnopqrstuvwxyz"                                   
    Len      dw Len-table1
    table2   db 61h dup(1), "22222222222222222222222222"  ; fghijklmnopqrstuvwxyzabcde                  
    k        dw 5                                                             
    msg      db "enter string(small letters) up to 10 chars, enter to finish", 13, 10, '$'
    input    db 10 dup('3'), '$' ;input[0] = f
    inputLen dw inputLen-input-1
CODESEG
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
	
	mov si,offset table1
	add si,[k]
	mov di,offset table2
	add di,61h
	cld
	mov cx,[Len]
	sub cx,5
	rep movsb
	mov si,offset table1
	mov cx,[k]
	rep movsb
	;display the msg
	mov dx,offset msg
	mov ah,9h
	int 21h
	;input,encrypt,store
	mov di,offset input
	mov bx,offset table2
	mov cx,[inputLen]
	xor si,si
	
	mov ah,1h
InputLoop:
	int 21h
	cmp al, 13
	je DisplayEncryptInput
	inc si  ;real input
	xlat
	stosb
	loop InputLoop
DisplayEncryptInput:
	mov cx, si
	mov si, offset input
	mov ah, 02h
PrintCharByChar:
	lodsb
	mov dl, al
	int 21h
	loop PrintCharByChar
	


exit:
	mov ax, 4c00h
	int 21h
END start
