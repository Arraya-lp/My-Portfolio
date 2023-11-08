import random

bot_choose= ["r", "p", "s"]


def play():
    print("Welcome to Bao Ying Chub Game!")
    player_name = input("What is your name: ")
    print(f"Hello. {player_name}.")
    print(""" This is how to play the game:
    Type r for rock
    Type p for paper
    Type s for scissor
    Type q for quit
    """)
    print("Let's start the game!")
    bot = random.sample(bot_choose, k=1)

    win = 0
    lose = 0
    draw = 0

    while True:
        # player
        guess = input("What do you choose? ")
        # bot 
        bot = random.choice(bot_choose)

        if guess == bot:
            print("Draw")
            draw = draw + 1
        elif (
            (guess == "r" and bot == "s") or
            (guess == "s" and bot == "p") or
            (guess == "p" and bot == 'r') 
        ):
            print("You Win!")
            win = win + 1
        elif guess == "q":
            print("Summary Score:")
            print(f"Win: {win}")
            print(f"Lose: {lose}")
            print(f"Draw: {draw}")
            print("See you again!")
            break
        else:
            print("You lose. Try again!")
            lose = lose + 1


play()
