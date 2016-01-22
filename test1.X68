*-----------------------------------------------------------
* Title      : final prac
* Written by : haomin shi  
* Date       : day before the final
* Description: whatever
*-----------------------------------------------------------
    ORG    $1000
START:                 
    ADDI #1, D1
    ADDI #20, D2 ;SETTING UP THE NUMBER LIMITS
    ADDI #18, D5
    
    MOVE.W D2, D3 ; MOVE THE D2 TO D3 FOR CALCULTIONS
    MOVE.W D2, D4 ; SEE ABOVE
    
    MOVE.W $2000, A1 ;MOVE THE MEM LOCATION TO A0
    *NOW THE MEM, LOWER AND HIGHER LIMTS ARE ALL SET
    *I WILL CREATE AN WHILE LOOP TO LOOP
    SUB D2,D1 ; SUB TO GETVALUE
    *NOW THE LOOP VALUE HAVE BEEN SET
LOOP1 MOVE.W D3, D6
      DIVU D6, D5 ;DIVIDE TO GET VALUE
      SWAP D6 ;SWAP TO CHECK REMINDER
      ADDI #0, D6
      BEQ LOOP2
      ADDI #1, D3
      SUB #1, D2
      BEQ DONE
      JMP LOOP1
      
      
LOOP2 MOVE.W D6, (A2)+ ;SAVE TO MEM
      ADDI #1, D3
      SUB #1, D2
      BEQ DONE
      
DONE 
      





    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
