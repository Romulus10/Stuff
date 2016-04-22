;PMJ's MPP ver2012.0 ...
br	main
;                                                                        
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:     .BLOCK     4
;.GLOBAL    JUNK
JUNK:  .BLOCK     2
;.GLOBAL    SAVED
SAVED:    .BLOCK     2
;.GLOBAL    SAVEA
SAVEA:    .BLOCK     2        ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:    .BLOCK     2        ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:   .BLOCK     2
;============================================================
;============================================================
;============================================================
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
null:	.EQUATE	"\x00"
.BYTE	31
one:	.BLOCK	31
.BYTE	31
two:	.BLOCK	31
aone:	.ADDRSS	one
atwo:	.ADDRSS	two
main:	NOP0
loop:	STRI	aone,d
STRI	atwo,d
LDA	one,dxf
CPA	null,d
BREQ	done
LDA	one,d
;;PUSHA  ; 
STA        -2,s;< PUSHA >
SUBSP      2,i;< PUSHA >
LDA	two,d
;;PUSHA  ; 
STA        -2,s;< PUSHA >
SUBSP      2,i;< PUSHA >
CALL	SCompTo
;;POP   ; 
STA        SAVEPP,d;< POP >
;;POPA  ;< POP > 
LDA        0,s;< POPA,POP >
ADDSP      2,i;< POPA,POP >
STA        arg',ams';< POP >
LDA        SAVEPP,d;< POP >
;;POP   ; 
STA        SAVEPP,d;< POP >
;;POPA  ;< POP > 
LDA        0,s;< POPA,POP >
ADDSP      2,i;< POPA,POP >
STA        arg',ams';< POP >
LDA        SAVEPP,d;< POP >
BR	loop
done:	STOP
BR STOPEND
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;                                                                        
;{ STRInput.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  STRInput
STRInput:  NOP0
Sobject:   .EQUATE  6
capacity:  .EQUATE  0
ignored:   .EQUATE  2
SUBSP    4,i
LDA      0,i
STA      ignored,s
LDX      -1,i
LDA      0,i
LDBYTEA  Sobject,sxf
STA      capacity,s
LDX      0,i
CPX      capacity,s
BRGE     error
LDA      0,i
loop:      CPX      capacity,s
BREQ     full
CHARI    Sobject,sxf
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     done
ADDX     1,i
BR       loop
full:      LDA      ignored,s
ADDA     1,i
STA      ignored,s
SUBX     1,i
ignore:    CHARI    Sobject,sxf
LDA      0,i
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     done
LDA      ignored,s
ADDA     1,i
STA      ignored,s
BR       ignore
done:      LDBYTEA  0,i
STBYTEA  Sobject,sxf
LDA      ignored,s
BR       return
error:     LDA      -1,i
return:    RET4
;} STRInput.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ BINOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  BINOutpt
m:         .EQUATE  4
BINOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      m,s
LDX      16,i
BINOloop:  NOP0
CPX      0,i
BREQ     BINOdone
ROLA
BRC      BINO1
BINO0:     CHARO    '0',i
BR       BINOnext
BINO1:     CHARO    '1',i
BINOnext:  NOP0
SUBX     1,i
BR       BINOloop
BINOdone:  NOP0
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} BINOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ HEXOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  HEXOutpt
Hm:        .EQUATE  4
HEXtext:   .block   4
.word    0
HEXOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      Hm,s
LDX      3,i
HEXOloop:  NOP0
CPX      0,i
BRLT     HEXOdone
ANDA     0x000F,i
CPA      10,i
BRLT     HEX1
ADDA     0x0007,i
HEX1:      ADDA     0x0030,i
STBYTEA  HEXtext,x
LDA      Hm,s
RORA
RORA
RORA
RORA
STA      Hm,s
SUBX     1,i
BR       HEXOloop
HEXOdone:  STRO     HEXtext,d
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} HEXOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ DUMPS.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  DumpS
Acopy:     .BLOCK   2
Xcopy:     .BLOCK   2
display:   .BLOCK   2
actual:    .BLOCK   2
dmsg:      .ASCII   "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII   ",\x00"
amsg:      .ASCII   "(A=\x00"
xmsg:      .ASCII   "(X=\x00"
dlmsg:     .ASCII   ": \x00"
DumpSN:    .EQUATE  2
DumpS:     NOP0
STA      Acopy,d
STX      Xcopy,d
STRO     dmsg,d
STA      actual,d
STRO     amsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
STRO     cmsg,d
STX      actual,d
STRO     xmsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
CHARO    '\n',i
LDX      DumpSN,s
MOVSPA
ADDA     4,i
STA      actual,d
DumpLoop:  CPX      0,i
BRLE     DumpDone
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     dlmsg,d
LDA      actual,n
STA      display,d
STA      SAVEPP,d
LDA      display,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     display,d
CHARO    '\n',i
LDA      actual,d
ADDA     2,i
STA      actual,d
SUBX     2,i
BR       DumpLoop
DumpDone:  LDX      Xcopy,d
LDA      Acopy,d
RET0
;} DUMPS.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ SCompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE  2             ;formal parameter; address of Sobject
Sobject2:  .EQUATE  4             ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:    .BLOCK    2
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;;ScompTo:SAVEX    ; 
ScompTo: NOP0 ;< SAVEX >
STX        SAVEX,d;< SAVEX >
;<<<<<<<<< Instrumentation
STRO     Sobject1,sf
CHARO    '-',i
STRO     Sobject2,sf
;>>>>>>>>>
;;CLRA                  ;  A = 0; ; 
LDA        0,i;< CLRA >
;;loop:INCX  ; 
loop: NOP0 ;< INCX >
ADDX       1,i;< INCX >
LDA	    SObject2,sxf
STA	    hold2,d
LDA	    SObject1,sxf
SUBA	    hold2,d
CPA	    0,i
BRNE	    done
CPA	    "x00",i
BREQ	    done
;;done:RESTOREX ; 
done: NOP0 ;< RESTOREX >
LDX        SAVEX,d;< RESTOREX >
;<<<<<<<<< Instrumentation
CHARO    ',',i
;;DECOA  ; 
STA        TEMP,d;< DECOA >
DECO       TEMP,d;< DECOA >
CHARO    '\n',i
;>>>>>>>>>
RET0                   ;
;} SCompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND: STOP
.END
