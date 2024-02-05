! Name of package being compiled: echoPrime
! 
! Symbols from runtime.s
	.import	_putString
	.import	_heapInitialize
	.import	_heapAlloc
	.import	_heapFree
	.import	_IsKindOf
	.import	_RestoreCatchStack
	.import	_PerformThrow
	.import	_runtimeErrorOverflow
	.import	_runtimeErrorZeroDivide
	.import	_runtimeErrorNullPointer
	.import	_runtimeErrorUninitializedObject
	.import	_runtimeErrorWrongObject
	.import	_runtimeErrorWrongObject2
	.import	_runtimeErrorWrongObject3
	.import	_runtimeErrorBadObjectSize
	.import	_runtimeErrorDifferentArraySizes
	.import	_runtimeErrorWrongArraySize
	.import	_runtimeErrorUninitializedArray
	.import	_runtimeErrorBadArrayIndex
	.import	_runtimeErrorNullPointerDuringCall
	.import	_runtimeErrorArrayCountNotPositive
	.import	_runtimeErrorRestoreCatchStackError
	.text
! ErrorDecls
	.import	_Error_P_System_UncaughtThrowError
	.align
! Functions imported from other packages
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.import	printDouble
	.import	_P_System_nl
	.import	RuntimeExit
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.import	getCh
	.import	_P_System_KPLMemoryInitialize
	.import	_P_System_KPLMemoryAlloc
	.import	_P_System_KPLMemoryFree
	.import	_P_System_KPLUncaughtThrow
	.import	_P_System_KPLIsKindOf
	.import	_P_System_KPLSystemError
! Externally visible functions in this package
	.export	_mainEntry
	.export	main
! The following class and its methods are from other packages
	.import	_P_System_Object
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
! Global variables in this package
	.data
_Global_count:
	.skip	4
	.align
! String constants
_StringConst_1:
	.word	10			! length
	.ascii	"echoPrime\n"
	.align
	.text
! 
! =====  MAIN ENTRY POINT  =====
! 
_mainEntry:
	set	_packageName,r2		! Get CheckVersion started
	set	0x3049a8f4,r3		! .  hashVal = 810133748
	call	_CheckVersion_P_echoPrime_	! .
	cmp	r1,0			! .
	be	_Label_2		! .
	ret				! .
_Label_2:				! .
	call	_heapInitialize
	jmp	main
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"/home/seed/SourceFiles/echoPrime.k\0"
_packageName:
	.ascii	"echoPrime\0"
	.align
!
! CheckVersion
!
!     This routine is passed:
!       r2 = ptr to the name of the 'using' package
!       r3 = the expected hashVal for 'used' package (myPackage)
!     It prints an error message if the expected hashVal is not correct
!     It then checks all the packages that 'myPackage' uses.
!
!     This routine returns:
!       r1:  0=No problems, 1=Problems
!
!     Registers modified: r1-r4
!
_CheckVersion_P_echoPrime_:
	.export	_CheckVersion_P_echoPrime_
	set	0x3049a8f4,r4		! myHashVal = 810133748
	cmp	r3,r4
	be	_Label_3
	set	_CVMess1,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess2,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess3,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess4,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess5,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess6,r1
	call	_putString
	mov	1,r1
	ret	
_Label_3:
	mov	0,r1
! Make sure _P_System_ has hash value 0xbd4cd0ad (decimal -1119039315)
	set	_packageName,r2
	set	0xbd4cd0ad,r3
	call	_CheckVersion_P_System_
	.import	_CheckVersion_P_System_
	cmp	r1,0
	bne	_Label_4
_Label_4:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION main  ===============
! 
main:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor_main,r1
	push	r1
	mov	3,r1
_Label_18:
	push	r0
	sub	r1,1,r1
	bne	_Label_18
	mov	4,r13		! source line 4
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	6,r13		! source line 6
	mov	"\0\0AS",r10
!   _Global_count = 0		(4 bytes)
	mov	0,r1
	set	_Global_count,r2
	store	r1,[r2]
! CALL STATEMENT...
!   _temp_5 = _StringConst_1
	set	_StringConst_1,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_5  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	7,r13		! source line 7
	mov	"\0\0CE",r10
	call	print
! WHILE STATEMENT...
	mov	8,r13		! source line 8
	mov	"\0\0WH",r10
_Label_6:
!	_Label_7	jmp	_Label_7
_Label_7:
	mov	8,r13		! source line 8
	mov	"\0\0WB",r10
! ASSIGNMENT STATEMENT...
	mov	9,r13		! source line 9
	mov	"\0\0AS",r10
!   Call the function
	mov	9,r13		! source line 9
	mov	"\0\0CE",r10
	call	getCh
!   Retrieve Result: targetName=c  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-10]
! IF STATEMENT...
	mov	10,r13		! source line 10
	mov	"\0\0IF",r10
!   _temp_12 = c XOR 113		(bool)
	loadb	[r14+-10],r1
	mov	113,r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_12 then goto _Label_10 else goto _Label_11
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_11
	jmp	_Label_10
_Label_11:
!   if intIsZero (_Global_count) then goto _Label_9
	set	_Global_count,r1
	load	[r1],r1
	cmp	r1,r0
	be	_Label_9
	jmp	_Label_10
_Label_9:
! THEN...
	mov	11,r13		! source line 11
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	11,r13		! source line 11
	mov	"\0\0AS",r10
!   _Global_count = _Global_count + 1		(int)
	set	_Global_count,r1
	load	[r1],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	set	_Global_count,r2
	store	r1,[r2]
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=c  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	12,r13		! source line 12
	mov	"\0\0CE",r10
	call	printChar
! --------------------  DEBUG  --------------------
	mov	13,r13		! source line 13
	mov	"\0\0DE",r10
	debug
	jmp	_Label_13
_Label_10:
! ELSE...
	mov	15,r13		! source line 15
	mov	"\0\0EL",r10
! ASSIGNMENT STATEMENT...
	mov	15,r13		! source line 15
	mov	"\0\0AS",r10
!   _Global_count = _Global_count + 1		(int)
	set	_Global_count,r1
	load	[r1],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	set	_Global_count,r2
	store	r1,[r2]
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=c  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CE",r10
	call	printChar
! END IF...
_Label_13:
! END WHILE...
	jmp	_Label_6
_Label_8:
! 
! Routine Descriptor
! 
_RoutineDescriptor_main:
	.word	_sourceFileName
	.word	_Label_14
	.word	0		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_15
	.word	-9
	.word	1
	.word	_Label_16
	.word	-16
	.word	4
	.word	_Label_17
	.word	-10
	.word	1
	.word	0
_Label_14:
	.ascii	"main\0"
	.align
_Label_15:
	.byte	'C'
	.ascii	"_temp_12\0"
	.align
_Label_16:
	.byte	'?'
	.ascii	"_temp_5\0"
	.align
_Label_17:
	.byte	'C'
	.ascii	"c\0"
	.align
