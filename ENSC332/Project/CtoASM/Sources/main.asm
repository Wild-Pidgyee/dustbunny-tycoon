;**************************************************************
;* This stationery serves as the framework for a              *
;* user application. For a more comprehensive program that    *
;* demonstrates the more advanced functionality of this       *
;* processor, please see the demonstration applications       *
;* located in the examples subdirectory of the                *
;* Freescale CodeWarrior for the HC12 Program directory       *
;**************************************************************

; export symbols
            XDEF asm_main, dostuff, dostuff_init
            ; we use export 'Entry' as symbol. This allows us to
            ; reference 'Entry' either in the linker .prm file
            ; or from C/C++ later on

; Include derivative-specific definitions 
		INCLUDE 'derivative.inc'  		

		    
; variable/data section
MY_EXTENDED_RAM: SECTION
; Insert here your data definition. For demonstration, temp_byte is used.
temp_byte:  DS.B   1


asdfx:  DS.W   1


; code section
MyCode:     SECTION

; this assembly routine is called by the C/C++ application
asm_main:
            MOVB   #1,temp_byte   ; just some demonstration code
            NOP                   ; Insert here your own code

            RTC                   ; return to caller




dostuff_init:
            LDD	#$0000
            STD asdfx
            RTC                   ; return to caller            

dostuff:
	PSHB ; Push second argument onto stack
	LDD asdfx
    ADDB 0,sp ; Second argument (pushed above)
    ADDB 4,sp ; First function argument, account for 3 bytes pushed onto stack for CALL instruction
    STD asdfx
    LEAS 1,sp
    
    RTC                   ; return to caller


