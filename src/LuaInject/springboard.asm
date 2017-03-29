.code

OPTION PROLOGUE:NONE, EPILOGUE:NONE


; 3参数后移扩展为4参数
public  SpringBoard3	
SpringBoard3 proc
	mov r9, r8
	mov r8, rdx
	mov rdx, rcx
	mov rcx, 11223344h; upvalue
SpringBoard3 endp

public  SpringBoard4	
SpringBoard4 proc
	mov qword ptr[rsp+20h], r9
	mov r9, r8
	mov r8, rdx
	mov rdx, rcx
	mov rcx, 1122334455667788h
	push rcx
	xchg rcx, qword ptr[rsp+8]
	xchg rcx, qword ptr[rsp]
SpringBoard4 endp


extrn lua_2 : proc
;int lua_intercept3(unsigned long api, void* L, int arg1, int arg2, int arg3)
lua_intercept3 proc ;api:dword, L:qword, arg1:dword, arg2:dword, arg3:dword
	mov eax, ecx
	call lua_2
	ret 8
lua_intercept3 endp

end

