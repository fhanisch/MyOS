	jmp main

	%include "screen.asm"

main:
	;print(msg,0,5,?)
	push 4			;color
	push 10			;y
	push 0			;x
	push msg		;str
	call print
main1:
	jmp main1

msg	db 'Kernal geladen.', 0
	times 512-($-$$) db 0
