*-----------------------------------------------------------
* Title      : Assignment #9
* Written by : Haomin Shi
* Date       : 11/2
* Description: a program that pass passing grades
*-----------------------------------------------------------
START:
    ORG $6000
T1 DS.W 1
T2 DS.W 1
T3 DS.W 1
T4 DS.W 1
T5 DS.W 1
T6 DS.W 1
T7 DS.W 1
T8 DS.W 1
T9 DS.W 1
T10 DS.W 1
T11 DS.W 1
T12 DS.W 1
T13 DS.W 1
T14 DS.W 1
T15 DS.W 1
T16 DS.W 1
T17 DS.W 1
T18 DS.W 1
T19 DS.W 1
T20 DS.W 1 ;CREATE LABELS FOR THE TEST SCORES, THIS WILL BE THE SCORE IN $6000, 20 OF THEM
    ORG $6200
T1F DS.W 1
T2F DS.W 1
T3F DS.W 1
T4F DS.W 1
T5F DS.W 1
T6F DS.W 1
T7F DS.W 1
T8F DS.W 1
T9F DS.W 1
T10F DS.W 1
T11F DS.W 1
T12F DS.W 1
T13F DS.W 1
T14F DS.W 1
T15F DS.W 1
T16F DS.W 1
T17F DS.W 1
T18F DS.W 1
T19F DS.W 1
T20F DS.W 1 ;CREATE LABELS FOR THE FAIL SCORES
    ORG $800
    MOVE.W #100, T1
    MOVE.W #78, T2
    MOVE.W #64, T3
    MOVE.W #33, T2
    MOVE.W #45, T5
    MOVE.W #67, T6
    MOVE.W #55, T7
    MOVE.W #66, T8
    MOVE.W #60, T9
    MOVE.W #53, T10
    MOVE.W #69, T11
    MOVE.W #98, T12
    MOVE.W #79, T13
    MOVE.W #80, T14
    MOVE.W #81, T15
    MOVE.W #88, T16
    MOVE.W #90, T17
    MOVE.W #94, T18
    MOVE.W #34, T19
    MOVE.W #87, T20
*FIRST LINE OF REAL CODE 
    MOVE.W #$6000,A0 ;SET UP THE A0 MEMLOCATION, FOR FUTURE USE
    MOVE.W #$6200,A2
    MOVE.B #20,D1  ;COUNT DOWN
    MOVE.B #0,D2 ;CALC FINAL
    MOVE.B #0,D3 ;CALC FAIL
    
CALCG MOVE.W (A0)+,D4
      SUB.W #50,D4
      BLT CALCF ; IF 50-D4 IS LT ZERO JUMP TO CALCF
      ADD #1,D2 ;CALC PASSING HOW MANY PPL
      BGT COUNT
      JMP DONE

CALCF ADD #1,D3 ;CALC FAILING HOW MANY PPL
      MOVE.W (A0),(A2)+ ;MOVE THE FALLING GRADE TO $6200+
      
COUNT SUB.W #1,D1 ;COUNTER -1
      BNE CALCG ;IF NOT ZERO JUMP TO CALCG
      BEQ DONE

DONE  
        

               
    SIMHALT           



    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
