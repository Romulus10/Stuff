; Sean Batzel
; Assignment 4 CMPS 250
;
; SortIntegers.pep - Read,Print and Sort integers
;
; And we thought it was difficult to handle passing arrays as arguments in C...
;
; P.M.J., April 2016
;---------------------------------------------------------------
         BR      main        
;---------------------------------------------------------------
capacity:.WORD   64          ;the capacity of the array
N:       .WORD   0           ;count of the number of integers
A:       .BLOCK  128         ;the array of integers
;--------
ZERO:    .WORD   0           ;the input sentinel value
NL:      .BYTE   '\n'        ;the "new line" character
;---------------------------------------------------------------
main:    NOP0                
         LDA     capacity,d  ;+ N = readInts(A,capacity);
         STA     -2,s        ;|
         LDA     A,i         ;|
         STA     -4,s        ;|
         SUBSP   4,i         ;|
         CALL    readInts    ;|
         ADDSP   4,i         ;|
         STA     N,d         ;+
;--------
         LDA     N,d         
         STA     -2,s        
         LDA     A,i         
         STA     -4,s        
         SUBSP   4,i         
         CALL    sortInts    
         ADDSP   4,i         
;--------
         LDA     N,d         ;+ prntInts(A,N);
         STA     -2,s        ;|
         LDA     A,i         ;|
         STA     -4,s        ;|
         SUBSP   4,i         ;|
         CALL    prntInts    ;|
         ADDSP   4,i         ;+
;--------
         STOP                
;-----------------------------------------------------------
; int readInts(int array[], int capacity);
;-----------------------------------------------------------
ia:      .EQUATE 2           
ic:      .EQUATE 4           
;-----------------------------------------------------------
ivalue:  .BLOCK  2           ;local static variable
readInts:NOP0                
         LDX     0,i         ; X = 0;
iloop:   CPX     ic,s        ;+ while(X < capacity) {
         BRGE    idone       ;|
         DECI    ivalue,d    ;|   ivalue = nextInt();
         LDA     ivalue,d    ;| + if(ivalue == ZERO) {
         CPA     ZERO,d      ;| |   EXIT while
         BREQ    idone       ;| + } else {
         ASLX                ;| | + array[X] = ivalue;
         STA     ia,sxf      ;| | |
; a is the address of the first byte in the array.
; We then add the value in the x register to it.
; f means deferred, which indicates that the prior address
; will be used to store the result in memory.
         ASRX                ;| | +
         ADDX    1,i         ;| | + X = X + 1;
;| + }
         BR      iloop       ;+ }
idone:   STX     ivalue,d    ;+ A = X;
         LDA     ivalue,d    ;+
         RET0                
;-----------------------------------------------------------
; int prntInts(int array[], int n);
;-----------------------------------------------------------
pa:      .EQUATE 2           
pn:      .EQUATE 4           
pvalue:  .BLOCK  2           
prntInts:NOP0                
         LDX     0,i         
ploop:   CPX     pn,s        
         BRGE    pdone       
         ASLX                
         LDA     pa,sxf      
         STA     pvalue,d    
         DECO    pvalue,d    
         CHARO   '\n',i      
         ASRX                
         ADDX    1,i         
         BR      ploop       
pdone:   RET0                
;-----------------------------------------------------------
; int sortInts(int array[], int n);
;-----------------------------------------------------------
ga:      .EQUATE 2           
gn:      .EQUATE 4           
tmp:     .BLOCK  2           
tmp2:    .BLOCK  2           
sortInts:NOP0                
         LDX     0,i         
gloop:   NOP0
         CPX     gn,s        
         BRGE    gend        
         LDA     ga,sxf      
         STA     tmp,d       
         ASLX                
         LDA     ga,sxf      
         STA     tmp2,d      
         ASRX
         CPA     tmp,d
         BRLE    less        
back:    NOP0
         ADDX    1,i         
         BR      gloop       
gend:    NOP0
         RET0                
less:    NOP0
         LDA     tmp,d      
         STA     ga,sxf    
         ASLX                
         LDA     tmp2,d       
         STA     ga,sxf     
         ASRX                
         BR      back        
         .END                  