*-----------------------------------------------------------
* Title      : ASSIGNMENT 6
* Written by : HAOMIN SHI
* Date       : 10/13/2015
* Description: A set of word length numbers are stored in memory
*              location starting at address $500. The count of
*              these numbers is located in D0. Write a subroutine
*              to store the smallest number at memory location 
*              specified in A0
*-----------------------------------------------------------
    ORG    $2000
START:

    MOVE.W #0003,D3
    MOVE.W #0003,D4
    MOVE.W #$1000,A0 ;SET MEMORY IN A0
    MOVE.W #22,$0500
    MOVE.W #23,$0502
    MOVE.W #24,$0504
    MOVE.W #25,$0506                  ; MOVE A SET OF NUMBER OF WORD LENTH TO ML STARTS 500
    MOVEA.W #$0500,A1 ;MOVE THE ADDRESS TO A1 TO CALC
    
    
    *SUBROUTINE 1 - THIS SUBROUTINE IS FOR CALC THE SUM OF THE SET OF NUMBERS
LOOP1 ADD.W (A1)+,D0
     SUB.W #1,D3    ;USE D3 AS THE COUNTER, THUS I WILL SET D3 AS 3
     BNE LOOP1       ;LOOP ENDS WHEN ADDED ALL NUMBERS RESULT IS IN D0

     
     
     MOVEA.W #$0506,A3 ;SET A-R READY FOR COUNTING
     
    *SUBROUTINE 2 - THIS IS TO CALC THE SMALLEST NUMBER, AND WILL SAVE THE NUMBER IN A0
      MOVE.W $0506,D7
    
LOOP2 CMP -(A3),D7
      BGT MOVE1
      JMP MOVE2

MOVE1 MOVE.W (A3),D7

MOVE2 SUB.W #1,D4
      BNE LOOP2
      
     BNE LOOP2 ;LOOP IF SOMETHING IS NOT LESS THEN THE OTHER
     
    
DONE MOVE.W D7,(A0)

    SIMHALT          
    END    START       

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
