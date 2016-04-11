;SortIntegers.pep - Read,Print and Sort integers
;
; P.M.J., April 2016
;---------------------------------------------------------------
         BR      main
;---------------------------------------------------------------
capacity:.WORD   64              ;the capacity of the array
N:       .WORD   0               ;count of the number of integers
A:       .BLOCK  128             ;the array of integers
val:     .BLOCK  2               ;a placeholder for a value getting swapped
swaps:   .BLOCK  2               ;number of swaps made in a pass through the array
ZERO:    .WORD   0               ;the input sentinel value
NL:      .BYTE   '\n'            ;the "new line" character
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
ia:     .EQUATE 2
ic:     .EQUATE 4 
;-----------------------------------------------------------
ivalue:    .BLOCK  2              ;local static variable
readInts:  NOP0
           LDX     0,i            ; X = 0;
iloop:     CPX     ic,s           ;+ while(X < capacity) {
           BRGE    idone          ;|  
           DECI    ivalue,d       ;|   ivalue = nextInt();
           LDA     ivalue,d       ;| + if(ivalue == ZERO) {
           CPA     ZERO,d         ;| |   EXIT while
           BREQ    idone          ;| + } else {
           ASLX                   ;| | + array[X] = ivalue;
           STA     ia,sxf         ;| | |
           ASRX                   ;| | +
           ADDX    1,i            ;| | + X = X + 1;
                                  ;| + }
           BR      iloop          ;+ }
idone:     STX     ivalue,d       ;+ A = X;
           LDA     ivalue,d       ;+
           RET0
;-----------------------------------------------------------
; int prntInts(int array[], int n);
;-----------------------------------------------------------
pa:        .EQUATE  2
pn:        .EQUATE  4
pvalue:    .BLOCK   2
prntInts:  NOP0
           LDX     0,i
ploop:     CPX     pn,s
           BRGE    pdone
           ASLX
           LDA     pa,sxf
           STA     pvalue,d
           DECO    pvalue,d
           CHARO   '\n',i
           ASRX
           ADDX    1,i
           BR      ploop
pdone:     RET0
;-----------------------------------------------------------
; int sortInts(int array[], int n);
;-----------------------------------------------------------
sortInts:  LDA        0,i
           STA        val,d        ;val = 0; 
           LDA        1,i
           STA        swaps,d      ;swaps = 1; 
           LDX        0,i          ;X = 0; 
sloop:     NOP0                    
           LDA        swaps,d
           CPA        0,i
           BREQ       sdone        ;if(swaps == 0){EXIT dowhile} 
           LDA        0,i
           STA        swaps,d      ;swaps = 0;      
sloopi:    CPX        N,d     
           BRGT       sloop        ;if(X > N){Go back to start of while loop b/c made a pass through the array} X IS NEVER GREATER THAN N
           ASLX
           LDA        A,x
           STA        val,d 
           ADDX       2,i 
           LDA        A,x 
           CPA        val,d        ;if(A[x+1] < A[x]){swap}
           BRLT       swap
           CPA        val,d        ;else{ /*A[x+1] >= A[x]*/ next}
           ASRX
           BR         sloopi       ;because 1 has been added to the index already, we just need to divide by 2 to get the index back
swap:      NOP0
           SUBX       2,i 
           LDA        A,x
           STA        val,d
           ADDX       2,i 
           LDA        A,x
           SUBX       2,i 
           STA        A,x         ;A[x] = A[x+1] 
           ADDX       2,i 
           LDA        val,d
           STA        A,x         ;A[x+1] = val 
           ASRX                   ;We're already at A[x+1], so we just need to shift right to divide by 2 to get our index
           LDA        swaps,d
           ADDA       1,i
           STA        swaps,d
           BR         sloopi
sdone:     LDA        A,x
           RET0

        .END