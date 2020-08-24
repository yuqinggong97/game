#lang racket

; Question 1 (i)
; Procedure 'a-game'.
; Each call to 'a-game' sets up an environment with a local state variable 'number', which specifies the initial amount of money in the account hold by a player.
; The code for creating two players is at the end of the procedure 'a-game', scoll down to have a look!
; The procedures from question 2 to 6 are in the 'a-game' procedure.
(define (a-game number)

  ; Question 1 (ii)
  ; Use 'a-game' to check whether the deposit ('number') made by a player is valid (a minimum of two and a maximum of thirty pounds), if not valid it returns an error message.
  ; Use an 'if' function.
  ; Use comparison function 'and' to restrict the range, the number should be greater or equal to 2 and less than or equal to 30.
  (if (and (>= number 2) (<= number 30))
      
         ; If the number is in range, use 'begin', which is a special form evaluating each element in order and evaluating to the very last expression.
         ; Use 'display' function to print a string.
         ; Starting a new line by using 'newline'. 
         (begin  ; Start evaluating expressions in order.
           (display "Game Player, you decide to go with number: ")  ; Print the string.
           (display number) ; Print the variable 'number', as we didn't use newline, it will stay at the same line with the previous string, i.e. go to the end.
           (newline)  ; Start a new line.
           (newline)
           (display "GREAT!!!")  ; Print the string.
           (newline)
           (newline)  ; Start a new line.
           (display "Remember, in the game, if the player wins, then he scores 1 point [Game Machine will increase player's account(number) by 1 pound, and deduct 2 pounds from its account].")  ; Print the string.
           (newline)  ; Start a new line.
           (newline) 
           (display "If the player loses, then he will lose 2 points [Game Machine will deduct 2 pounds from player's account(number), and add 1 pound in its account].")  ; Print the string.
           (newline)  ; Start a new line.
           (newline)  
           (display "During the game, if the player doesn't have any credit, then the game ends. The player can start a new game by re-register with a deposit.")  ; Print the string.
           (newline)  ; Start a new line.
           (newline)  ; Start a new line.
           (display "Generating a random number is now requested. Game Machine is about to generate a random number and compare it with the player's number.")  ; Print the string: If the amount is valid, the procedure 'randomnum' is requested.    
           )  ; End of 'begin', stop evaluating.
         
         ; As I mention we use 'if' function to check, here is the 'else' part.
         ; Else: If the number is not in range, will start evaluating the below expressions.
         (begin
           (display "Game Player, you decide to go with number: ")
           (display number)  ; Print the variable 'number'.
           (display "..Wrong, number/amount should be a minimum of 2 pounds and a maximum of 30 pounds.") ; If the amount is not valid, asking the player to make a valid deposit.
           )  ; End of 'begin', stop evaluating.
         )  ; End of 'if' function.
; call this procedure by tying: (define P1(a-game 21)), where 21 can be replaced by another number, and can create another player Px by replacing P1.

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

  
  ; Question 2 (i)
  ; Procedure 'the-game-number'.
  ; Each call to 'a-game' sets up an environment with a local state variable 'number'.
  ; Within this environment, 'a-game' defines procedure 'the-game-number' that takes a "request" as input and returns one of the four defined local procedures, which I wrote in the next few sessions.
  ; The 'the-game-number' procedure itself is returned as the value that represents the game object.
  (define (the-game-number request)

    ; Use a 'cond' function to check what the request is.
    ; Use 'eq?' to check if the input matches.
    (cond ((eq? request 'randomnum) randomnum)          ; If the input is 'randomnum, returns local procedure 'randomnum'. 
          ((eq? request 'increasemoney) increasemoney)  ; If the input is 'increasemoney, returns local procedure 'increasemoney'.
          ((eq? request 'decreasemoney) decreasemoney)  ; If the input is 'decreasemoney, returns local procedure 'decreasemoney'.
          ((eq? request 'topup) topup)                  ; If the input is 'topup, returns local procedure 'topup'.

          ; Question 2 (ii)
          (else (error "..unknown request" request))))    ; If the input is none of the above, returns an error message.
; call this procedure by tying: ((P1 request)), where P1 is the player that you created, and request can be replaced by either: 'increasemoney, 'decreasemoney, 'topup, 'randomnum.
; for 'topup, you put the amount of money after it, and for 'randomnum, you put 'random' after it. If it is not any of them, will return an error message.
                        
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  
  ; Question 3 (i)
  ; Procedure 'randomnum'.
  ; Each call to 'a-game' sets up an environment with a local state variable 'number'.
  ; Within this environment, the procedure 'a-game' defines the procedure 'randomnum' that access 'number' and 'random'.
  ; The procedure is with a local state variable 'random', this variable yields a random number ranging from 2 to 50.
  ; When the number is valid, the procedure 'randomnum' is requested.
  ; The 'randomnum' procedure returns the random number.
  ; And return the number chosen by the player, i.e. the variable 'number' when you create the player by using procedure 'a-game', e.g. P1: 21. 
  (define (randomnum random)

  ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: Set the value of 'random' to a random number between 2 to 50.
  ; The value of variable 'random' yields a random number between 2 and 50.
  (set! random (random 2 51)) ; (random x y): range from x to y-1.
    random
    
    (display "The random number is: ")  ; Print this string.
    (display random)  ; Print the 'random' variable. Each call we have a new random value (Sometime you will get the same but rarely).
    (newline)
    (newline)
    (display "Game Player, your number is: ")
    (display number)   ; Print the 'number' variable. Which is the intial amount of money choosen by the player.

    ; Question 3 (ii)
    (if (<= number random)   ; Compare the variable 'number' with the variable 'random', if 'number' is less than or equal to 'random', 
        (begin   ; Start evaluating the below expressions:
        (newline)
        (newline)
        (display "If your number is less than or equal the random number, you lose, otherwise you win.")
        (newline)
        (newline)
        (display "Unfortunately, you have lost, Game Machine will deduct 2 pounds from your account.")   ; Informing the player that he has lost and informing him that his balance decreases 2 pounds.
         )  ; End of 'begin'.

        ; Else: If the 'number' is greater than the random number,
        (begin  ; Start evaluating the below expressions:
        (newline)
        (newline)
        (display "If your number is less than or equal the random number, you lose, otherwise you win.")
        (newline)
        (newline)
        (display "Great, you have won, Game Machine will add one pound in your account.")  ; Informing the player that he has won and informing him that his balance increases 1 pound.
        ) ; End of 'begin'.
        ) ; End of 'if' function.
    )
; call this procedure by tying: ((P1 'randomnum)random)

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  ; Question 4 (i)
  ; Procedure 'decreasemoney'.
  ; Each call to 'a-game' sets up an environment with a local state variable 'number'.
  ; Within this environment, the procedure 'a-game' defines the procedure 'decreasemoney' that access 'number'. 
  ; If the player has lost, this procedure is requested. 
  (define (decreasemoney)
    (set! number (- number 2))   ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: The value of variable 'number' decreases by 2 pounds.
    number
    
    (display "Game Player, previously you had: ")
    (display (+ number 2))  ; Returns the old value: But the value of 'number' here is the changed one. So we need to add 2 back.
    (display " pound(s)")
    (newline)
    (newline)
    (display "You have lost, Game Machine is deducting 2 pounds from your account!")  ; returns a message to inform the player that his balance has been decremented by 2 pounds.
    (newline)
    (newline)
    (display "You now have: ")
    (display number)  ; Returns the new value: Each call the 'number' decreases by 2.
    (display " pound(s)")
    

        ; Question 4 (ii)
        (if (> number 1)  ; Check whteher the new value of 'number' is greater than one, if it is, the player has enough credit to continue to play.
            (begin
              (newline)
              (newline)
              (display "You still have enough credit to play."))  ; Returns a message to inform the player there is enough credit.

            (begin  ; Else: If the new value of 'number' is less than or equal to one, the player doesn't have enough credit to continue to play.
              (newline)
              (newline)
              (display "..Sorry, you are out of credit, which you can't continue to play. To continue playing, you need to top-up.")  ; Return a message to inform the player there isn't enough credit.
              (newline)
              (newline)
              (display "See you soon!!!")
        )))
; call this procedure by tying: ((P1 'decreasemoney))
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   

  ; Question 5 (i)
  ; Procedure 'topup'.
  ; Each call to 'a-game' sets up an environment with a local state variable 'number'.
  ; Within this environment, the procedure 'a-game' defines the procedure 'topup' that access 'number' and 't'.
  ; The procedure 'topup' is with a local state variable 't'.
  ; If the player hasn't got enough credit, this procedure is requested.

  (define (topup t)
    (set! number t)  ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: The value of variable 'number' is now 't', so the value of 't' becomes the new balance.
    number
    
    (display "Game Player, you just topped up: ")
    (display t)  ; Returns the specified amount that the player wants to top-up.
    (display " pound(s)")

    
      ; Question 5 (ii)
      ; Check if the new value of 'number' is valid or not. The range is from 2 to 30 as we define at the beginning.
      (if (and (>= number 2)(<= number 30)) ; If the number is in the range, start evaluating the below expressions.
        (begin
        (newline)
        (newline)
        (display "\"Great, you can play now\""))  ; Returns a "valid" message to the player.

        
        (begin  ; Else: If the new value of 'number' is not ranging from 2 to 30, start evaluating the below expressions.
        (newline)
        (newline)
        (display "Wrong, number/amount should be a minimum of 2 pounds and a maximum of 30 pounds"))  ; Returns an "error" message to the player.
        )
)
; call this procedure by tying: ((P1 'topup)20), where 20 is the amount of money.

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

  
  ; Question 6 
  ; Procedure 'increasemoney'.
  ; Each call to 'a-game' sets up an environment with a local state variable 'number'.
  ; Within this environment, the procedure 'a-game' defines the procedure 'increasemoney' that access 'number'. 
  ; If the player has won, this procedure is requested. 
  (define (increasemoney)
    (set! number (+ number 1))  ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: The value of variable 'number' increases by 1 pound.
    number
    
    (display "Game Player, previously you had: ")
    (display (- number 1))  ; Returns the old value: The value of 'number' here is the changed one. So we need to subtract 1 back.
    (display " pound(s)")
    (newline)
    (newline)
    (display "You have scored 1 point, and been awarded 1 pound by the Game Machine!")  ; Returns a message to inform the player that his balance has been incremented by 1 pound.
    (newline)
    (newline)
    (display "You now have: ")
    (display number)  ; Returns the new value: Each call the 'number' increases by 1.
    (display " pound(s)")
      )
; call this procedure by tying: ((P1 'increasemoney))
  
  

  the-game-number)  ; The 'the-game-number' procedure itself is returned as the value that represents the game object. This is the message-passing style.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Question 1 (i)
; Using 'a-game' to create two objects: players. Players do not affect the other, they are completely independent objects.
; Or you can create them at the running window (console).


; Create a player P1, with its own local state variable 'number': 21.
; Get rid of the ';' at the beginning of to create P1.

; (define P1 (a-game 21))



; Crater a player P2, with its own local state variable 'number': 31.
; Get rid of the ';' at the beginning of to create P2.

; (define P2 (a-game 31))  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; Question 7
; Define a variable 'game_machine_amount' to indicate the balance of money in the account of the Game Machine. This value can be changed later. See Question 10.
(define game_machine_amount 10)  ; Here we set the current balance to 10 first.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; Question 8 (i)
; Procedure 'game_machine_decrement'.
; If a player wins, the Game Machine decreases 2 pounds from its balance.
(define (game_machine_decrement)
  (set! game_machine_amount (- game_machine_amount 2))  ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: Assesses the balance of the variable 'game_machine_amount'. And the value of 'game_machine_amount' decreases by 2.
  game_machine_amount        
  
  (display "Game Machine, before you had: ")
  (display (+ game_machine_amount 2))  ; Returns the old value: The value of 'game_machine_amount' here is the changed one. So we need to add 2 back.
  (display " pound(s)")
  (newline)
  (newline)
  (display "You now have: ")
  (display game_machine_amount)  ; Returns the new value: Each call the value of 'game_machine_amount' decreases by 2.
  (display " pound(s)")

  
  ; Question 8 (ii)
  ; Check whether the new value of the 'game_machine_amount' is greater than one, if it is, the game machine has enough money to continue to play.
  (if (> game_machine_amount 1)
      (begin
        (newline)
        (newline)
        (display "Game Machine, there is still enough money in the machine for a game to be played."))  ; Returns a message to inform the game machine that there is enough money.

      
       ; Else: If the new value of 'game_machine_amount' is less than or equal to one, the game machine doesn't have enough money to continue to play.
      (begin
        (newline)
        (newline) ; Returns a message to inform the game machine that there isn't enough money.
        (display "..Game Machine, there isn't any credit in the machine for a game to be played, needs to top up")) 
       )
    )
; call this procedure by tying: (game_machine_decrement)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; Question 9 (i)
; Procedure 'game_machine_increment'.
; If a player has lost, the balance of the Game Machine increases 1 pounds.
(define (game_machine_increment)

    ; Question 9 (ii)
    (set! game_machine_amount (+ game_machine_amount 1))  ; Syntax: (set! <name> <expression>). This special form changes the value associated with an existing name: Assesses the balance of the variable 'game_machine_amount'. And the value of 'game_machine_amount' increases by 1.
    game_machine_amount    
  
    (display "Game Machine, before you had: ")
    (display (- game_machine_amount 1))  ; Returns the old value: The value of 'game_machine_amout' here is the changed one. So we need to subtract 1 back.
    (display " pound(s)")
    (newline)
    (newline)
    (display "You now have: ")
    (display game_machine_amount)  ; Returns the new value: Each call 'game_machine_amount' increases by 1.
    (display " pound(s)")
    )
; call this procedure by tying: (game_machine_increment)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; Question 10
; Variable 'game_machine_amount' and top-up.
; If the balance of the Game Machine is less than or equal to one, it needs a new value for the variable 'game_machine_amount'.
; The value can be changed at the running window (console).

; Get rid of the ";" at the beginning to change to value of 'game_machine_amount'.
; (define game_machine_amount 20)     
  
  

  
 
  
  
    
        

        






