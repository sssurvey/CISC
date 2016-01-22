*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $7500
START:                  ; first instruction of program
    MOVE.W #$8001,A5
    MOVE.W #$AB, $8001
    BCHG.B D1, (A5)
    


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
