*-----------------------------------------------------------
* Title      : Arrange numbers
* Written by : Ahmed Akram "Akramovic"
* Date       : 20-12-2020
* Description: Arrange numbers in decending order
*-----------------------------------------------------------
            ORG    $1000

            MOVE.B  #LengthOfArray,D2   let d2 is i amd equal numbers of elements - 1

START       MOVE.L  #List,A0            Move address of list in A0
            MOVE.L  A0,A1               Move address of List in A1 and increment the address by 1 byte
            ADD.L   #1,A1               
            MOVE.B  #0,D3               let d3 is j and equal 0
            
SWAPING     MOVE.B  (A0),D0             Move element in list and store it in D0
            MOVE.B  (A1),D1             Move the next element in list and store it in D1
            CMP.B   D0,D1               Compare D0 and D1
            BLE     DonotSwap           If the result is less than or equal don't swap
            MOVE.B  D0,(A1)             Swap the 2 numbers
            MOVE.B  D1,(A0)

DonotSwap   ADD     #1,A0               increment A0
            ADD     #1,A1               increment A1
            ADD.B   #1,D3               increment D3
            CMP     D2,D3               Compare D2,D3 
            BNE     SWAPING             If they aren't equal jump to SWAPING
            SUB.B   #1,D2               decrement D2 to get the remaning elements
            BNE     START               If there any remaining elements jump to START 

            STOP #$2700
            
LengthOfArray   EQU 7

List            DC.B 1, 2, 5, 4, 8, 5, 4, 2

                END    $1000        
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
