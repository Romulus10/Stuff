;PMJ's MPP ver2012.0 ...
;Zach Black Assignment 5
;
;Spring 2016
;
;Worked with Alex Pinarreta and Zach McGill
;---------------------------------------------------------------------------
; ERROR ===> unable to _l0l0l0l0l0l0l0l0l0l0ll0 dupplicate label, STOPEND
;PMJ's MPP ver2012.0 ...
;PMJ's MPP ver2012.0 ...
;SortStrings.pep2 - read, print and sort an array of strings
;
; P.M.J., April 2016
;---------------------------------------------------------------
BR       main
;
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:      .BLOCK   4
;.GLOBAL    JUNK
JUNK:      .BLOCK   2
;.GLOBAL    SAVED
SAVED:     .BLOCK   2
;.GLOBAL    SAVEA
SAVEA:     .BLOCK   2                                              ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:     .BLOCK   2                                              ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:    .BLOCK   2
;============================================================
;============================================================
;============================================================
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;---------------------------------------------------------------
prompt:    .ASCII   "Enter:\x00"
msgunord:  .ASCII   "Unordered...\n\x00"
msgord:    .ASCII   "Ordered...\n\x00"
;--------
LENGTH:    .EQUATE  31                                             ; Expresses the maximum length of a string
LIMIT:     .EQUATE  24                                             ; Expresses the capacity of the array
.ASCII   "<<<<<<<<"                                     ; Just a marker for visual inspection
p:         .BLOCK   48                                             ; The array of pointers; LIMIT * 2
.ASCII   "--------"                                     ; Just a marker for visual inspection
a:         .BLOCK   768                                            ; The array of strings; (1+LENGTH) * LIMIT
.ASCII   ">>>>>>>>"                                     ; Just a marker for visual inspection
count:     .BLOCK   2                                              ; The number of strings read and stored
;--------
;---------------------------------------------------------------
main:      NOP0
;;;;;;;;;; PUSH     LENGTH,i                                       ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      LENGTH,i                                       ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     LIMIT,i                                        ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      LIMIT,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     a,i                                            ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      a,i                                            ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     p,i                                            ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      p,i                                            ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
CALL     readStgs
ADDSP    8,i
STA      count,d
;--------
DECO     count,d
CHARO    '\n',i
;--------
STRO     msgunord,d
;;;;;;;;;; PUSH     count,d                                        ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      count,d                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     p,i                                            ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      p,i                                            ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
CALL     prntStgs
ADDSP    4,i
;--------
;;;;;;;;;; PUSH     count,d                                        ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      count,d                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     p,i                                            ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      p,i                                            ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
CALL     sortStgs
ADDSP    4,i
;--------
STRO     msgord,d
;;;;;;;;;; PUSH     count,d                                        ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      count,d                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
;;;;;;;;;; PUSH     p,i                                            ;
STA      SAVEPP,d                                       ;< PUSH >
LDA      p,i                                            ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
CALL     prntStgs
ADDSP    4,i
done:      STOP
BR       STOPEND
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
BREQ     LL0
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
BREQ     LL0
LDA      ignored,s
ADDA     1,i
STA      ignored,s
BR       ignore
LL0:       LDBYTEA  0,i
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
;{ readStgs.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;---------------------------------------------------------------
;  int readStgs(address p[], byte a[], int length, int limit)
;---------------------------------------------------------------
LL1:       .EQUATE  2
LL2:       .EQUATE  4
length:    .EQUATE  6
limit:     .EQUATE  8
;--------
.BYTE    31
value:     .BLOCK   31
index:     .BLOCK   2
disp:      .BLOCK   2
;---------------------------------------------------------------
msgtrunc:  .ASCII   "WARNING: input truncation \x00"
msgfull:   .ASCII   "WARNING: string array full\n\x00"
;---------------------------------------------------------------
;.GLOBAL   readStgs
readStgs:  NOP0
;;;;;;;;;; CLR      index,d                                        ;
STA      SAVEA,d                                        ;< CLR >
;;;;;;;;;; CLRA                                                    ;< CLR >
LDA      0,i                                            ;< CLRA,CLR >
STA      index,d                                        ;< CLR >
LDA      SAVEA,d                                        ;< CLR >
;loop:;;;; CPM       index,d,limit,s                                ;
LL3:       NOP0                                                    ;< CPM >
LDA      index,d                                        ;< CPM >
CPA      limit,s                                        ;< CPM >
BRGE     LL4
;;;;;;;;;; STRI     value,i                                        ;
;;;;;;;;;; PUSH     value,i                                        ;< STRI >
STA      SAVEPP,d                                       ;< PUSH,STRI >
LDA      value,i                                        ;< PUSH,STRI >
;;;;;;;;;; PUSHA                                                   ;< PUSH,STRI >
STA      -2,s                                           ;< PUSHA,PUSH,STRI >
SUBSP    2,i                                            ;< PUSHA,PUSH,STRI >
LDA      SAVEPP,d                                       ;< PUSH,STRI >
CALL     STRInput                                       ;< STRI >
ADDSP    2,i                                            ;< STRI >
;;;;;;;;;; TSTA                                                    ;
CPA      0,i                                            ;< TSTA >
BREQ     move
STRO     msgtrunc,d
;;;;;;;;;; DECOA                                                   ;
STA      TEMP,d                                         ;< DECOA >
DECO     TEMP,d                                         ;< DECOA >
CHARO    '\n',i
;move:;;;; PUSH      value,i                                        ;
move:      NOP0                                                    ;< PUSH >
STA      SAVEPP,d                                       ;< PUSH >
LDA      value,i                                        ;< PUSH >
;;;;;;;;;; PUSHA                                                   ;< PUSH >
STA      -2,s                                           ;< PUSHA,PUSH >
SUBSP    2,i                                            ;< PUSHA,PUSH >
LDA      SAVEPP,d                                       ;< PUSH >
CALL     Slength
ADDSP    2,i
;;;;;;;;;; TSTA                                                    ;
CPA      0,i                                            ;< TSTA >
BREQ     LL5
;---------
LDA      length,s
;;;;;;;;;; INCA                                                    ;
ADDA     1,i                                            ;< INCA >
STA      -2,s
LDX      index,d
ASLX
ASLX
ASLX
ASLX
ASLX
STX      disp,d
;;;;;;;;;; ADD      disp,d,LL2,s                                   ;
;;;;;;;;;; SAVEA                                                   ;< ADD >
STA      SAVEA,d                                        ;< SAVEA,ADD >
LDA      disp,d                                         ;< ADD >
ADDA     LL2,s                                          ;< ADD >
STA      disp,d                                         ;< ADD >
;;;;;;;;;; RESTOREA                                                ;< ADD >
LDA      SAVEA,d                                        ;< RESTOREA,ADD >
;;;;;;;;;; MOVE     disp,d,-4,s                                    ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      disp,d                                         ;< MOVE >
STA      -4,s                                           ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
LDA      value,i
;;;;;;;;;; DECA                                                    ;
SUBA     1,i                                            ;< DECA >
STA      -6,s
SUBSP    6,i
CALL     memcpy
ADDSP    6,i
;---------
;;;;;;;;;; INC      disp,d                                         ;
;;;;;;;;;; SAVEA                                                   ;< INC >
STA      SAVEA,d                                        ;< SAVEA,INC >
LDA      disp,d                                         ;< INC >
ADDA     1,i                                            ;< INC >
STA      disp,d                                         ;< INC >
;;;;;;;;;; RESTOREA                                                ;< INC >
LDA      SAVEA,d                                        ;< RESTOREA,INC >
LDX      index,d
ASLX
;;;;;;;;;; MOVE     disp,d,LL1,sxf                                 ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      disp,d                                         ;< MOVE >
STA      LL1,sxf                                        ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
;---------
;;;;;;;;;; INC      index,d                                        ;
;;;;;;;;;; SAVEA                                                   ;< INC >
STA      SAVEA,d                                        ;< SAVEA,INC >
LDA      index,d                                        ;< INC >
ADDA     1,i                                            ;< INC >
STA      index,d                                        ;< INC >
;;;;;;;;;; RESTOREA                                                ;< INC >
LDA      SAVEA,d                                        ;< RESTOREA,INC >
BR       LL3
;--------
LL4:       STRO     msgfull,d
;--------
LL5:       LDA      index,d
RET0
;} readStgs.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ prntStgs.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;Zach Black Assignment 5
;
;Spring 2016
;
;Worked with Alex Pinarreta and Zach McGill
;---------------------------------------------------------------
;  int prntStgs(address p[], int n)
;---------------------------------------------------------------
LL6:       .EQUATE  2
n:         .EQUATE  4
;--------
LL7:       .BLOCK   2
ptemp:     .BLOCK   2
;---------------------------------------------------------------
;Subprogram to print out array of Strings
;---------------------------------------------------------------
;.GLOBAL   prntStgs
prntStgs:  NOP0
;;;;;;;;;; CLRX                                                    ;
LDX      0,i                                            ;< CLRX >
LL8:       CPX      n,s                                            ;Compares the size of array
BRGE     LL9                                            ;Break when Greater than or equal to
ASLX
LDA      LL6,sxf                                        ;Loads address of array
ASRX
STA      ptemp,d                                         ;Stores address of ptemp
STRO     ptemp,d                                        ;Prints string in that address
CHARO    '\n',i
ADDX     1,i                                            ;Adds 1 to n
BR       LL8                                            ;Branchs back to LL8
LL9:       RET0
;} prntStgs.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ sortStgs.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;Zach Black Assignment 5
;
;Spring 2016
;
;Worked with Alex Pinarreta and Zach McGill
;-----------------------------------------------------------
; int sortStgs(address p[], int n);
;-----------------------------------------------------------
LL10:      .EQUATE  8
LL11:      .EQUATE  10
;----------
dmax:      .EQUATE  0
pmax:      .EQUATE  2
temp:      .EQUATE  4
;----------
;.GLOBAL  sortStgs
sortStgs:  SUBSP    6,i                                            ;   Reserve Space
LDX      LL11,s                                         ;+  LL11 = LL11 * 2;
ASLX                                                    ;|
STX      LL11,s                                         ;+
LL12:      LDX      LL11,s                                         ;+ while(n > 0) {
BREQ     LL14                                           ;|
;;;;;;;;;; CLRX                                                    ;|   X = 0; ;
LDX      0,i                                            ;< CLRX >
STX      dmax,s                                         ;|   dmax = X;
;;;;;;;;;; MOVE     LL10,sxf,pmax,s                                ;|   max = a[dmax]; ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      LL10,sxf                                       ;< MOVE >
STA      pmax,s                                         ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
inner:     ADDX     2,i                                            ;| + while(X < n) {
CPX      LL11,s                                         ;| |
BREQ     LL13                                           ;| |
;;;;;;;;;; CPM      LL10,sxf,pmax,s                                ;| | + if(a[X] > max) { ;
LDA      LL10,sxf                                       ;< CPM >
CPA      pmax,s                                         ;< CPM >
BRLE     next                                           ;| | |
STX      dmax,s                                         ;| | |   dmax = X;
;;;;;;;;;; MOVE     LL10,sxf,pmax,s                                ;| | |   max = a[simax]; ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      LL10,sxf                                       ;< MOVE >
STA      pmax,s                                         ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
NOP0                                                    ;| | + }
next:      BR       inner                                          ;| + }
;---------                         ;|
LL13:      SUBX     2,i                                            ;| + LL11 = LL11 - 2;
STX      LL11,s                                         ;| +
;;;;;;;;;; MOVE     LL10,sxf,ptemp,s                               ;|   temp = a[n]; ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      LL10,sxf                                       ;< MOVE >
STA      ptemp,s                                        ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
LDX      dmax,s                                         ;| + A = a[dmax]
LDA      LL10,sxf                                       ;| |
LDX      LL11,s                                         ;| + a[n] = A;
STA      LL10,sxf                                       ;| +
LDX      dmax,s                                         ;| + a[dmax] = temp;
;;;;;;;;;; MOVE     temp,s,LL10,sxf                                ;| + ;
;;;;;;;;;; SAVEA                                                   ;< MOVE >
STA      SAVEA,d                                        ;< SAVEA,MOVE >
LDA      temp,s                                         ;< MOVE >
STA      LL10,sxf                                       ;< MOVE >
;;;;;;;;;; RESTOREA                                                ;< MOVE >
LDA      SAVEA,d                                        ;< RESTOREA,MOVE >
BR       LL12                                           ;+ }
LL14:      ADDSP    6,i                                            ;+ return
RET0                                                    ;+
;} sortStgs.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ memcpy.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-----------------------------------------------------------
; void memcpy(byte *from, byte *to, int n);
;-----------------------------------------------------------
from:      .EQUATE  2
to:        .EQUATE  4
LL15:      .EQUATE  6
;-----------------------------------------------------------
;-----------------------------------------------------------
;.GLOBAL  memcpy
;memcpy:;; SAVE                                                     ;
memcpy:    NOP0                                                    ;< SAVE >
;;;;;;;;;; SAVEA                                                   ;< SAVE >
STA      SAVEA,d                                        ;< SAVEA,SAVE >
;;;;;;;;;; SAVEX                                                   ;< SAVE >
STX      SAVEX,d                                        ;< SAVEX,SAVE >
;;;;;;;;;; CLRA                                                    ;
LDA      0,i                                            ;< CLRA >
;;;;;;;;;; CLRX                                                    ;
LDX      0,i                                            ;< CLRX >
LL16:      CPX      LL15,s
BRGE     LL17
LDBYTEA  from,sxf
STBYTEA  to,sxf
;;;;;;;;;; INCX                                                    ;
ADDX     1,i                                            ;< INCX >
BR       LL16
;done:;;;; RESTORE                                                  ;
LL17:      NOP0                                                    ;< RESTORE >
;;;;;;;;;; RESTOREX                                                ;< RESTORE >
LDX      SAVEX,d                                        ;< RESTOREX,RESTORE >
;;;;;;;;;; RESTOREA                                                ;< RESTORE >
LDA      SAVEA,d                                        ;< RESTOREA,RESTORE >
RET0
;} memcpy.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ Slength.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String length subprogram that returns the count of the number of
; characters in the string.
;
;********  int Slength (char[] Sobject)
;
;-- Arguments -----------------------------------------------------------
Sobjectl:  .EQUATE  2                                              ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
;-- Entry Point ---------------------------------------------------------
Slength:   NOP0
;;;;;;;;;; SAVEX                                                   ;
STX      SAVEX,d                                        ;< SAVEX >
;;;;;;;;;; CLRA                                                    ;  A = 0; ;
LDA      0,i                                            ;< CLRA >
;;;;;;;;;; CLRX                                                    ;  X = 0; ;
LDX      0,i                                            ;< CLRX >
loopl:     LDBYTEA  Sobjectl,sxf                                   ;+ while(Sobjectl[X] != 0x00) {
CPA      0,i                                            ;|
BREQ     donel                                          ;|
ADDX     1,i                                            ;|   X = x + 1;
BR       loopl                                          ;+ }
donel:     STX      -2,s                                           ;+ A = X;
;;;;;;;;;; RESTOREX                                                ;
LDX      SAVEX,d                                        ;< RESTOREX >
LDA      -2,s                                           ;+
RET0                                                    ;
;} Slength.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ ScompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE  2                                              ;formal parameter; address of Sobject
Sobject2:  .EQUATE  4                                              ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:     .BLOCK   2
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;ScompTo:; SAVEX                                                    ;
ScompTo:   NOP0                                                    ;< SAVEX >
STX      SAVEX,d                                        ;< SAVEX >
;<<<<<<<<< Instrumentation
STRO     Sobject1,sf
CHARO    '-',i
STRO     Sobject2,sf
;>>>>>>>>>
;;;;;;;;;; CLRA                                                    ;  A = 0; ;
LDA      0,i                                            ;< CLRA >
;---------
; S t u b b e d
;---------
;;;;;;;;;; CLRX                                                    ;  X = 0; ;
LDX      0,i                                            ;< CLRX >
LL18:      LDBYTEA  Sobjectl,sxf                                   ;+ while(Sobjectl[X] != 0x00) {
CPA      0,i                                            ;|
BREQ     LL19                                           ;|
LDBYTEA  Sobject2,sxf                                   ;+ while(Sobject2[X] != 0x00) {
CPA      0,i                                            ;|
BREQ     LL19                                           ;|
CPA      Sobjectl,sxf
BREQ     same
CPA      Sobjectl,sxf
BRLT     before
CPA      Sobjectl,sxf
BRGT     after
same:      ADDX     1,i
BR       LL18
before:    STA      -1,d
LDA      2,s
BR       LL19
after:     STA      1,d
LDA      2,s
BR       LL19
;done:;;;; RESTOREX                                                 ;
LL19:      NOP0                                                    ;< RESTOREX >
LDX      SAVEX,d                                        ;< RESTOREX >
;<<<<<<<<< Instrumentation
CHARO    ',',i
;;;;;;;;;; DECOA                                                   ;
STA      TEMP,d                                         ;< DECOA >
DECO     TEMP,d                                         ;< DECOA >
CHARO    '\n',i
;>>>>>>>>>
RET0                                                    ;
;} ScompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND:   STOP
;Resolver Report:
; done --> LL0
; p --> LL1
; a --> LL2
; loop --> LL3
; full --> LL4
; done --> LL5
; p --> LL6
; index --> LL7
; loop --> LL8
; done --> LL9
; p --> LL10
; n --> LL11
; loop --> LL12
; move --> LL13
; done --> LL14
; n --> LL15
; loop --> LL16
; done --> LL17
; loop --> LL18
; done --> LL19
;Resolver Report:
STOPEND: STOP
.END
