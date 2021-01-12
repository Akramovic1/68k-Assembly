*-----------------------------------------------------------
* Title      : ADDER
* Written by : Ahmed Akram "Akramovic"
* Date       : 20-12-2020
* Description: ADD a list of the numbers
*-----------------------------------------------------------
     ORG    $1000
    
START   MOVE.B  #LengthOfArray,D0           six numbers to add
        LEA     List(PC),A0                 A0 points at the numbers
        CLR.W   D1                          Clear the sum

Loop    ADD.W   (A0)+,D1                    Repeat Add number to total
        SUB.B   #1,D0                       decrement the remaning numbers by 1
        BNE     Loop                        Untill all numbers added
     
        STOP    #$2700                      Stop the program
    
LengthOfArray EQU 6    
List    DC.W 6,4,12,16,17,50                my numbers which I want to add       
        
        END    START                        end the program




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
