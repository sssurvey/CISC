*-----------------------------------------------------------
* Title      : ECE 242 Assignment 5
* Written by : Haomin Shi
* Date       : 9/30/2015
* Description: First assembly program
*-----------------------------------------------------------
    ORG    $3000
START:                  

    MOVE.W #31, (A2)
    MOVE.W #23, D3
    MOVE.W #24, $0500
    MOVE.W #29, $0502
    MOVE.W #27, $0530
    MOVE.W #22, $0536
    
    ADD.W A2,D3
    ADD.L $0500,D3
    ADD.L $0502,D3
    ADD.L $0530,D3
    ADD.L $0536,D3
    
    MOVE.L D3, $0400
        
    NOT D3
    
    MOVE.L D3, $0420
    
    NEG D3
    
    MOVE.L D3, $0430

    

    END    START        ; 


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
