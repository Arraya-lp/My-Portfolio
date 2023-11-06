menu_id <- c(1,2,3,4,5)
menu <- c("Hawaiian","Chicken Trio", "Double Pepperoni", "Seafood Cocktail", "Super Deluxe")
size <- c("s", "m", "l")


menu_price_smallest <- c(299, 299, 299, 399, 399)
size_price <- c(0, 50, 100)


pizza_menu <- data.frame(menu_id, menu, menu_price_smallest)
pizza_size <- data.frame(size, size_price)

price <- 0

chatbot <- function(){
  print("Hello! Customer. Welcome to R Pizza")
  print("Would you like to order the pizza? yes or no")
  user <- readLines("stdin", n=1)
  if(user == "yes"){
    print("Please see our menu and enter your prefer menu id.")
    print(pizza_menu)
    user_input1 <- readLines("stdin", n=1)
    print(paste(pizza_menu[pizza_menu$menu_id == user_input1, 2], "is selected"))

    print("What size do you prefer? s m or l")
    user_input2 <- readLines("stdin", n=1)
    print(paste("Size", user_input2, "is selected"))


    print("Wait a moment.....")


    total_price <- price + pizza_menu[pizza_menu$menu_id == user_input1,3] + pizza_size[pizza_size$size == user_input2,2]

    print(paste("Total price:", total_price, "Baht"))
    print("Thank you and enjoy your meal")
  } else {
    print("See you again")
  } 
}

chatbot()
