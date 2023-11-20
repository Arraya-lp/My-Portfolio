library(readxl)
library(tidyverse)
library(caret)

## import and combine data
h1 <- read_excel("House Price India.xlsx", sheet = 1)
h2 <- read_excel("House Price India.xlsx", sheet = 2)
house_price_india <- bind_rows(h1, h2)

glimpse(house_price_india)

## prep data
## check NA 
## visualize column
## adjust right skewed distribution using log()
names(house_price_india) <- tolower(names(house_price_india))

house_price_india %>% 
  complete.cases() %>% mean()  

hist(house_price_india$price)  

house_price_india$price <- log(house_price_india$price)


## Build model
## 1. split data
split_data <- function(df) {
  set.seed(20)
  n <- nrow(house_price_india)
  id <- sample(1:n , size=0.8*n)
  train_df <- house_price_india[id, ]
  test_df <- house_price_india[-id, ]
  return(list(training=train_df,
              testing=test_df))
}

prep_data <- split_data(house_price_india)
train_df <- prep_data[[1]]
test_df <- prep_data[[2]]

## 2. train model
model <- train(price ~ ., 
               data = train_df,
               method = "lm")

## 3. score model
p <- predict(model, newdata=test_df)

## 4. evaluate model
## MAE, RMSE
error <- test_df$price - p
(mae <- mean(abs(error)))
(rmse <- sqrt(mean(error**2)))
