;
; File generated by cc65 v 2.13.3
;
	.fopt		compiler,"cc65 v 2.13.3"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank, tmp1, ptr1, ptr2
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_waitvblank
	.export		_write_string
	.export		_main

.segment	"RODATA"

L0001:
	.byte	$48,$65,$6C,$6C,$6F,$2C,$20,$4A,$55,$41,$4E,$00

; ---------------------------------------------------------------
; void __near__ write_string (__near__ unsigned char*)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_write_string: near

.segment	"CODE"

;
; *((unsigned char*)0x2006) = 0x20;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:00 Y:XX
	lda     #$20                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:XX X:00 Y:XX  Out A:20 X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:20 X:00 Y:XX  Out A:20 X:00 Y:XX
;
; *((unsigned char*)0x2006) = 0x41;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:20 X:00 Y:XX  Out A:20 X:00 Y:XX
	lda     #$41                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:20 X:00 Y:XX  Out A:41 X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:41 X:00 Y:XX  Out A:41 X:00 Y:XX
;
; while(*str)
;
L0009:	ldy     #$01                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:01
	jsr     ldaxysp              ; USE: ____Y______  CHG: __AXY______  SIZE: 3    In A:XX X:XX Y:01  Out A:XX X:XX Y:XX
	ldy     #$00                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:00
	jsr     ldauidx              ; USE: __AXY______  CHG: __AX___1___  SIZE: 3    In A:XX X:XX Y:00  Out A:XX X:XX Y:00
	jeq     L000A                ; USE: ___________  CHG: ___________  SIZE: 5    In A:XX X:XX Y:00  Out A:XX X:XX Y:00
;
; *((unsigned char*)0x2007) = *str;
;
	ldy     #$01                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:00  Out A:XX X:XX Y:01
	jsr     ldaxysp              ; USE: ____Y______  CHG: __AXY______  SIZE: 3    In A:XX X:XX Y:01  Out A:XX X:XX Y:XX
	ldy     #$00                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:00
	jsr     ldauidx              ; USE: __AXY______  CHG: __AX___1___  SIZE: 3    In A:XX X:XX Y:00  Out A:XX X:XX Y:00
	sta     $2007                ; USE: __A________  CHG: ___________  SIZE: 3    In A:XX X:XX Y:00  Out A:XX X:XX Y:00
;
; str++;
;
	ldy     #$01                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:00  Out A:XX X:XX Y:01
	jsr     ldaxysp              ; USE: ____Y______  CHG: __AXY______  SIZE: 3    In A:XX X:XX Y:01  Out A:XX X:XX Y:XX
	sta     regsave              ; USE: __A________  CHG: _________V_  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
	stx     regsave+1            ; USE: ___X_______  CHG: _________V_  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
	jsr     incax1               ; USE: __AX_______  CHG: __AX_______  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
	ldy     #$00                 ; USE: ___________  CHG: ____Y______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:00
	jsr     staxysp              ; USE: __AXY______  CHG: ____Y______  SIZE: 3    In A:XX X:XX Y:00  Out A:XX X:XX Y:XX
	lda     regsave              ; USE: _________V_  CHG: __A________  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
	ldx     regsave+1            ; USE: _________V_  CHG: ___X_______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
;
; }
;
	jmp     L0009                ; USE: ___________  CHG: ___________  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
;
; }
;
L000A:	jsr     incsp2               ; USE: ___________  CHG: ____Y______  SIZE: 3    In A:XX X:XX Y:00  Out A:XX X:XX Y:XX
	rts                          ; USE: ___________  CHG: ___________  SIZE: 1    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; waitvblank(); /* This is found in nes.h */
;
	jsr     _waitvblank          ; USE: ___________  CHG: HLAXYT112VS  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
;
; *((unsigned char*)0x2006) = 0x3F;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:00 Y:XX
	lda     #$3F                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:XX X:00 Y:XX  Out A:3F X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:3F X:00 Y:XX  Out A:3F X:00 Y:XX
;
; *((unsigned char*)0x2006) = 0x00;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:3F X:00 Y:XX  Out A:3F X:00 Y:XX
	lda     #$00                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:3F X:00 Y:XX  Out A:00 X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
;
; *((unsigned char*)0x2007) = 1;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
	lda     #$01                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:00 X:00 Y:XX  Out A:01 X:00 Y:XX
	sta     $2007                ; USE: __A________  CHG: ___________  SIZE: 3    In A:01 X:00 Y:XX  Out A:01 X:00 Y:XX
;
; *((unsigned char*)0x2006) = 0x3F;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:01 X:00 Y:XX  Out A:01 X:00 Y:XX
	lda     #$3F                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:01 X:00 Y:XX  Out A:3F X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:3F X:00 Y:XX  Out A:3F X:00 Y:XX
;
; *((unsigned char*)0x2006) = 0x03;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:3F X:00 Y:XX  Out A:3F X:00 Y:XX
	lda     #$03                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:3F X:00 Y:XX  Out A:03 X:00 Y:XX
	sta     $2006                ; USE: __A________  CHG: ___________  SIZE: 3    In A:03 X:00 Y:XX  Out A:03 X:00 Y:XX
;
; *((unsigned char*)0x2007) = 0x30;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:03 X:00 Y:XX  Out A:03 X:00 Y:XX
	lda     #$30                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:03 X:00 Y:XX  Out A:30 X:00 Y:XX
	sta     $2007                ; USE: __A________  CHG: ___________  SIZE: 3    In A:30 X:00 Y:XX  Out A:30 X:00 Y:XX
;
; write_string("Hello, JUAN");
;
	lda     #<(L0001)            ; USE: ___________  CHG: __A________  SIZE: 2    In A:30 X:00 Y:XX  Out A:XX X:00 Y:XX
	ldx     #>(L0001)            ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:XX X:00 Y:XX  Out A:XX X:XX Y:XX
	jsr     pushax               ; USE: __AX_______  CHG: ____Y______  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
	jsr     _write_string        ; USE: ___________  CHG: HLAXYT112VS  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
;
; *((unsigned char*)0x2005) = 0x00;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:00 Y:XX
	lda     #$00                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:XX X:00 Y:XX  Out A:00 X:00 Y:XX
	sta     $2005                ; USE: __A________  CHG: ___________  SIZE: 3    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
;
; *((unsigned char*)0x2005) = 0x00;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
	lda     #$00                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
	sta     $2005                ; USE: __A________  CHG: ___________  SIZE: 3    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
;
; *((unsigned char*)0x2001) = 8;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
	lda     #$08                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:00 X:00 Y:XX  Out A:08 X:00 Y:XX
	sta     $2001                ; USE: __A________  CHG: ___________  SIZE: 3    In A:08 X:00 Y:XX  Out A:08 X:00 Y:XX
;
; while(1);
;
L002F:	jmp     L002F                ; USE: ___________  CHG: ___________  SIZE: 3    In A:XX X:XX Y:XX  Out A:XX X:XX Y:XX
;
; return 0;
;
	ldx     #$00                 ; USE: ___________  CHG: ___X_______  SIZE: 2    In A:XX X:XX Y:XX  Out A:XX X:00 Y:XX
	lda     #$00                 ; USE: ___________  CHG: __A________  SIZE: 2    In A:XX X:00 Y:XX  Out A:00 X:00 Y:XX
	jmp     L0010                ; USE: ___________  CHG: ___________  SIZE: 3    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX
;
; }
;
L0010:	rts                          ; USE: ___________  CHG: ___________  SIZE: 1    In A:00 X:00 Y:XX  Out A:00 X:00 Y:XX

.endproc

