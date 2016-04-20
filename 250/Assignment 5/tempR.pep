;PMJ's MPP ver2012.0 ...
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
ScompTo:   SAVEX
;<<<<<<<<< Instrumentation
STRO     Sobject1,sf
CHARO    '-',i
STRO     Sobject2,sf
;>>>>>>>>>
CLRA                   ;  A = 0;
loop:	   INCX
LDA	    SObject2,sxf
STA	    hold2,d
LDA	    SObject1,sxf
SUBA	    hold2,d
CPA	    0,i
BRNE	    done
CPA	    x00,i
BREQ	    done
done:      RESTOREX
;<<<<<<<<< Instrumentation
CHARO    ',',i
DECOA
CHARO    '\n',i
;>>>>>>>>>
RET0                   ;
STOPEND: STOP
;Resolver Report:

