*-----------------------------------------------------------
* Title      : Assignment 8
* Written by : Haomin Shi
* Date       : 10/27/2015
* Description: A program for lab 8
*-----------------------------------------------------------
START:
    ORG    $600
DATA1 DS.B 1
DATA2 DS.B 1
DATA3 DS.B 1
DATA4 DS.B 1
DATA5 DS.B 1
DATA6 DS.B 1
DATA7 DS.B 1
DATA8 DS.B 1
DATA9 DS.B 1
DATA10 DS.B 1
DATA11 DS.B 1
DATA12 DS.B 1
DATA13 DS.B 1
DATA14 DS.B 1
DATA15 DS.B 1 ;CREATE LABLES FOR ALL THE DATA   
    ORG    $800
    MOVE.W #$600,A0 ;SET UP THE A0 MEMLOCATION, FOR FUTURE USE
    MOVE.B #13, DATA1
    MOVE.B #14, DATA2
    MOVE.B #73, DATA3
    MOVE.B #24, DATA4
    MOVE.B #63, DATA5
    MOVE.B #74, DATA6
    MOVE.B #25, DATA7
    MOVE.B #26, DATA8
    MOVE.B #28, DATA9
    MOVE.B #21, DATA10
    MOVE.B #26, DATA11
    MOVE.B #12, DATA12
    MOVE.B #10, DATA13
    MOVE.B #19, DATA14
    MOVE.B #13, DATA15 ;MOVE NUMBERS TO LOCATION
*FIRST LINE OF REAL CODE
    MOVE.B #15,D2 ;USE D1 AS COUNTER
SUM MOVE.B (A0)+,D1 ;A0 LOCATION MOVE TO D1, +1 EACH LOOP
    ADD D1,D0 ;ADDITION SAVE SUM @ D0
    SUBQ.B #1,D2 ;-1 FOR THE SAKE OF LOOP
    BNE SUM ;BRANCH SUM
    MOVE.W D0, D3
    DIVU #15,D3
    MOVE.L D3, $650
    MOVE.B $651, $741
    MOVE.B $653, $740
    SIMHALT             
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
