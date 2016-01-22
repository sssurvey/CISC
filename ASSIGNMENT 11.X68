*-----------------------------------------------------------
* Title      : ASSIGNMENT 11
* Written by : HAOMIN SHI
* Date       : 11/10/2015
* Description: THIS IS A PROGRAM THAT ASK USER TO IMPUT DATA, SORT DATA,
*              SAVE DATA, DISPLAY DATA.
*-----------------------------------------------------------
    ORG    $2000
    
LINE1 DC.B 'PLAESE INPUT: ',0
LINE2 DC.B 'TOTAL NUMBER OF STUDENT: ',0
LINE3 DC.B 'TOTAL NUMBER OF FAIL STUDENT: ',0
LINE4 DC.B 'TOTAL NUMBER OF PASS STUDENT: ',0
LINE5 DC.B 'AVG OF ALL PASSING SCORES: ',0
LINE6 DC.B 'AVG OF ALL FAILING SCORES: ',0
LINE7 DC.B 'AVG OF ALL SCORES: ',0
pmt dc.b $d,$a,'',0


        
 
START:
        MOVE.W #20, D3 *INPUT LOOP COUNTER
        MOVE.W #$100, A2
        MOVE.W #$400, A3 *FAIL ADDRESS
        MOVE.W #$600, A5 *PASS ADDRESS
        MOVE.W #50, D4
        MOVE.W #$100, A4
        MOVE.W #20, D5
    

LOOPIN  LEA LINE1,A1 *LOAD LINE IN TO A1 REG
        
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        
        MOVE.B #4,D0 *REQUEST FOR IN
        TRAP #15
        
        MOVE.W D1, (A2)+ *MOVE THE INPUT TO A ADDRESS, WAITING FOR FURTHER NOTICE
        SUB #1, D3
        BNE LOOPIN
        
        
        MOVE.W #0, D7 *PASS COUNTER
        MOVE.W #0, D2 *FAIL COUNTER
        

LOOPSR  MOVE.W (A4)+, D6 *A SORT LOOP SORT THE, DEFINE PASSING AND FAILING
        SUB.B D4, D6     *COMPARE SCORE, WHETHER >50 OR <50
        BLT FAIL           
        BGE PASS
        
FAIL    ADD #50, D6
        ADD #1,D2
        MOVE.W D6, (A3)+    *FAIL STUDENT SCORE WILL BE IN MEM 400+
        SUB #1,D5           *LOOP TIMES CALCULATE
        BEQ STOP            *IF LOOP END JUMP TO NEXT STEP
        JMP LOOPSR          *IF THERE ARE STILL SCORES, JUMP TO LOOPSR TO SORT
PASS    ADD #50, D6
        ADD #1,D7
        MOVE.W D6, (A5)+    *PASS STUDENT SCORE WILL BE IN MEM 600+
        SUB #1,D5           *LOOP TIMES CALCULATE
        BEQ STOP            
        JMP LOOPSR
       
        
STOP    LEA LINE2,A1 *LOAD LINE IN TO A1 REG
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        MOVE.W #20,D1 *just going to display 20 since there are going to be 20 input
        MOVE.B #3,D0 *DISPLAY 
        TRAP #15
        LEA PMT,A1  *CHANGE OUTPUT LINE
        MOVE.B #14,D0
        TRAP #15
        
        LEA LINE3,A1 *LOAD LINE IN TO A1 REG 'FAIL'
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        
        
        MOVE.W D2, D1 *FAIL PPL -----D2
        MOVE.B #3,D0
        TRAP #15
        LEA PMT,A1  *CHANGE OUTPUT LINE
        MOVE.B #14,D0 
        TRAP #15
        
        *PASS PPL-----D7
        LEA LINE4,A1 *LOAD LINE IN TO A1 REG
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        MOVE.W D7,D1
        MOVE.B #3,D0 
        TRAP #15
        
        LEA PMT,A1  *CHANGE OUTPUT LINE
        MOVE.B #14,D0 
        TRAP #15
        
        * NOW CALC AVAGE
        
        
        *REUSE ALL D REG AND A REG
        MOVE.W #$400, A3 *F
        MOVE.W #$600, A5 *P
        MOVE.W D2, D3 *NUMBER OF FAIL
        MOVE.W D3, D2 *BKUP
        MOVE.W D7, D4 *NUMBER OF PASS
        *D5,6,7 FREE
        
        * ALL AVG OF PASS
LOP4F   ADD (A3)+, D5
        SUB #1, D2 *SUB 4 LOOP
        BNE LOP4F
        DIVU D5, D3
        
        LEA LINE5,A1 *LOAD LINE IN TO A1 REG
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        
        
        MOVE.W D5,D1
        MOVE.B #3,D0 
        TRAP #15
        
        LEA PMT,A1  *CHANGE OUTPUT LINE
        MOVE.B #14,D0 
        TRAP #15
        
        
        
        MOVE.W D7,D2
  
LOP4P   ADD (A5)+, D6
        SUB #1, D2 *SUB 4 LOOP
        BNE LOP4P
        DIVU D6, D7
        
        LEA LINE6,A1 *LOAD LINE IN TO A1 REG
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        
        
        MOVE.W D6,D1
        MOVE.B #3,D0 
        TRAP #15
        
        
        ADD D5,D6
        MOVE.W #20, D4
        DIVU D6, D4
        
        LEA PMT,A1  *CHANGE OUTPUT LINE
        MOVE.B #14,D0 
        TRAP #15

        
        LEA LINE7,A1 *LOAD LINE IN TO A1 REG
        MOVE.B #14,D0 *DISPLAY 
        TRAP #15
        
        
        MOVE.W D6,D1
        MOVE.B #3,D0 
        TRAP #15
        
        
        


    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
