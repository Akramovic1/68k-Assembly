*-----------------------------------------------------------
* Title      : Deleting multiple spaces from a string 
* Written by : Ahmed Akram "Akramovic"
* Date       : 20-12-2020
* Description: Deleting multiple spaces from a string
*-----------------------------------------------------------
            ORG     $1000  
        
START       LEA     String(PC),A0   Set both pointers to the start of the string 
            LEA     STRing(PC),A1

Next        MOVE.B  (A0)+,D0        Get a character of the string
            Move.B  D0,(A1)+        Copy it to NewString Array and increment A1 by 1
            CMP.B   #$FF,D0         Check if Character is null
            BEQ     NullHandler     If it nul jump NullHandler 
            CMP.B   #' ',D0         Check if it space 
            BNE     Next            if not a space, continue copying to the new array

Loop        MOVE.B  (A0)+,D0        Get another character
            CMP.B   #$FF,D0         Check if it null
            BEQ     NullHandler2    If it nul jump NullHandler2 
            CMP.B   #' ',D0         Check if it space 
            BEQ     Loop            continue looping untill non space element found
            LEA     -1(A0),A0       back the pointer to the last char
            BRA     Next            Go back to string
        
NullHandler LEA     -2(A1),A1       back th pointer 
            MOVE.B  #$FF,(A1)       Check if the pointer pointed to null
            LEA     2(A1),A1        add 2 bytes to pointer
            BRA     NullLoop        executes NullLoop to null all remaining elements  

NullHandler2 SUB     #1,A1          back th pointer
             MOVE.B  #$FF,(A1)      Check if the pointer pointed to null
             ADD     #1,A1          add 1 bytes to pointer
            
NullLoop    CMP.B   #$FF,(A1)       check if pointer pointed to null 
            BEQ     EXIT            
            MOVE.B  #$FF,(A1)+      remove elements 
            BRA     NullLoop        continue looping untill remove all remaining elements
               
EXIT        STOP    #$2700


String  DC.B  'the         test     '
     
        END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
