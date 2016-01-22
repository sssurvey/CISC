*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:
AGAIN    MOVE.L #$2313, D1
         MOVE.W #$2000, A1
         MOVE.L D1, (A1)
         MOVE.L #$2313, D2
         SUB D3, (A1)
         BEQ DONE
         JMP AGAIN
         
DONE     ADDI #1, D6



             

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
