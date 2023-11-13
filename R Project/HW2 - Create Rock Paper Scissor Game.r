https://replit.com/@arrayalukpoo/Bootcamp08HW2PaoYingChub

win <- 0
lose <- 0
draw <- 0

choose <- c("r","p", "s", "q")
item <- c("rock", "paper", "scissors", "quit")
df <- data.frame(choose, item)

play_game <- function(){
  print("Welcome to Pao Ying Chub Game")
  print("What is your name?")
  player_name <- readLines("stdin", n=1)
  print(paste("Hello!", player_name, "Let's start the game!"))
 

  while(TRUE){
    print("Choose r for rock") 
    print("Choose p for paper")
    print("Choose s for scissors")
    print("Choose q to quit the game")
    #player
    player <- readLines("stdin", n=1)
    #com
    bot <- sample(choose,1)

        if(player == bot){
          print("Draw")
          draw <- draw + 1
        }
        else if(player == "r" & bot == "s" | player == "p" &           bot == "r" | player == "s" & bot == "p"){
          print("You win!")
          win <- win +1
        }
        else if(player == "q"){
          print("---------------")
          print("Score Summary")
          print(paste("Win:", win))
          print(paste("Lose:", lose))
          print(paste("Draw:", draw))
          print(paste("See you again!", player_name))
          break
        }
        else{
          print("You lose. Try again!")
          lose <- lose + 1
        }
  } 
}

play_game()
