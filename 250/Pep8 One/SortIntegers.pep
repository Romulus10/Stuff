;Name: Sean Batzel
;
;In collaboration with: Matthew Woehle and Sean Batzel
;
;SortIntegers.pep - Read,Print and Sort integers
;April 2016
;---------------------------------------------------------------
         BR      main        
;---------------------------------------------------------------
capacity:.WORD   64          ;the capacity of the array
N:       .WORD   0           ;count of the number of integers
A:       .BLOCK  128         ;the array of integers
val:     .BLOCK  2           ;a placeholder for a value getting swapped
pos:     .BLOCK  2           
swappd:  .WORD   1           ;swaps in the array
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
         LDA     N,d         ;+ sortInts(A,N);
         STA     -2,s        ;|
         LDA     A,i         ;|
         STA     -4,s        ;|
         SUBSP   4,i         ;|
         CALL    sortInts    ;|
         ADDSP   4,i         ;+
         LDA     N,d         ;+ prntInts(A,N);
         STA     -2,s        ;|
         LDA     A,i         ;|
         STA     -4,s        ;|
         SUBSP   4,i         ;|
         CALL    prntInts    ;|
         ADDSP   4,i         ;+
done:    NOP0                
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
sortInts:LDA     swappd,d    
         CPA     0,i         
         BREQ    lpout       
sloop:   LDA     0,i         ;"while" loop
         STA     swappd,d    
sloopi:  LDA     1,i         ;"for loop" start
         STA     pos,d       
sloopii: LDA     pos,d       
         CPA     N,d         
         BRGE    forout      ;if(pos > N){leave the forloop}
         LDX     pos,d       
         ASLX                
         LDA     A,x         
         STA     val,d       ;val = A[pos*2]
         SUBX    2,i         
         CPA     A,x         ;if(A[pos*2] >= A[pos*2 - 2]){fornxt}
         BRGE    fornxt      
         LDA     A,x         
         ADDX    2,i         
         STA     A,x         ;A[pos*2] = A[(pos+1)*2]
         SUBX    2,i         
         LDA     val,d       
         STA     A,x         
         LDA     1,i         
         STA     swappd,d    ;swappd = 1
fornxt:  LDA     pos,d       ;next element
         ADDA    1,i         
         STA     pos,d       
         BR      sloopii     
forout:  BR      sortInts    ;leaves the for loop
lpout:   LDX     0,i         ;out of the while loop
sdone:   LDA     A,x         
         RET0                
         .END                  