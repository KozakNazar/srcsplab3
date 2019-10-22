.386
.model flat, c
printf PROTO near C :dword, :VARARG
.data
fmt1 db "result = ", 0;
fmt2 db "%f", 13, 10, 0;
temp qword ?
K equ 00025630h; (153136d)
.code
calcLab3__useMacro PROC ; X = K + B2 - D2/C1 + E1*F2 // K=0x00025630 (153136)
    finit
    push ebp
	mov ebp, esp

	mov dword ptr temp, K
	fild temp
	fadd qword ptr [ebp + 8]  ; K + B2

	fld qword ptr [ebp + 20]
	fdiv dword ptr [ebp + 16]
	fchs
	fadd                      ; X = K + B2 - D2/C1
	
	fld dword ptr [ebp + 28]
	fmul qword ptr [ebp + 32]
	fadd                      ; X = K + B2 - D2/C1 + E1*F2

		
	fst temp
	mov ecx, dword ptr temp[4]
	mov eax, dword ptr temp[0]
    push ecx; for next call printf
    push eax; for next call printf

	invoke printf, OFFSET fmt1

	pop eax; restore eax
	pop ecx; restore ecx
    invoke printf, OFFSET fmt2, eax, ecx

	pop ebp
	ret

calcLab3__useMacro ENDP
END