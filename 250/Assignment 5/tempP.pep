;-----------------------------------------------------------
; int sortStgs(address p[], int n);
;-----------------------------------------------------------
p:         .EQUATE  8
n:         .EQUATE  10
;----------
dmax:      .EQUATE  0
pmax:      .EQUATE  2
temp:      .EQUATE  4
swappd:	   .WORD    1
pos:	   .BLOCK   2
val:	   .BLOCK   2
;----------
           .GLOBAL  sortStgs
sortStgs:  SUBSP    6,i            ;   Reserve Space
;---------
         LDA     swappd,d    
         CPA     0,i         
         BREQ    lpout       
sloop:   LDA     0,i         ;"while" loop
         STA     swappd,d    
sloopi:  LDA     1,i         ;"for loop" start
         STA     pos,d       
sloopii: LDA     pos,d       
         CPA     n,d         
         BRGE    forout      ;if(pos > N){leave the forloop}
         LDX     pos,d       
         ASLX                
         LDA     p,x         
         STA     val,d       ;val = A[pos*2]
         SUBX    2,i         
         CPA     p,x         ;if(A[pos*2] >= A[pos*2 - 2]){fornxt}
         BRGE    fornxt      
         LDA     p,x         
         ADDX    2,i         
         STA     p,x         ;A[pos*2] = A[(pos+1)*2]
         SUBX    2,i         
         LDA     val,d       
         STA     p,x         
         LDA     1,i         
         STA     swappd,d    ;swappd = 1
fornxt:  LDA     pos,d       ;next element
         ADDA    1,i         
         STA     pos,d       
         BR      sloopii     
forout:  BR      sortStgs    ;leaves the for loop
lpout:   LDX     0,i         ;out of the while loop
sdone:   LDA     p,x         
         RET0       
;---------
done:   ADDSP    6,i            ;+ return
        RET0                    ;+
	.END