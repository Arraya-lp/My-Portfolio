## Project2 - create database on Postgresql => create a few tables about pizza restaurant
library(RPostgreSQL)
library(tidyverse)

## Create Connection
con <- dbConnect(PostgreSQL(),
                 host = "floppy.db.elephantsql.com",
                 port = 5432,
                 user = "sdkgsgse",
                 password = "##########password#############",
                 dbname = "sdkgsgse")


dbListTables(con)

## Add pizza_menu table
pizza_id <- 1:9
pizza_name <- c(rep("Hawaiian", times=3), rep("Meat deluxe",times=3), rep("Seafood Cocktail", times=3))
pizza_size <- rep(c("s","m","l"), times=3)
pizza_cost <- rep(c(199,299,399), times=3)

pizza_menu <- data.frame(pizza_id,
                         pizza_name,
                         pizza_size,
                         pizza_cost)

dbWriteTable(con, "pizza_menu", pizza_menu)

## Add customer table
customer_id <- 1:5
customer_name <- c("Anne", "Jane", "Tom", "Kris", "Emma")
customer_age <- c(22, 26, 35, 38, 28)
customer <- data.frame(customer_id,
                       customer_name,
                       customer_age)

dbWriteTable(con, "customer", customer)

## Add transaction table
trans_id <- 1:5
pizza_id <- c(3,4,6,1,8)
customer_id <- c(4,3,2,1,5)

transaction <- data.frame(trans_id,
                          pizza_id,
                          customer_id)

dbWriteTable(con, "transaction", transaction)

## Add another table

drink <- data.frame(id = 1:3,
                    name = c("Coke",
                             "Lemon Tea",
                             "Orange Juice"))

dbWriteTable(con, "drink", drink)

## Get Data
dbListFields(con, "pizza_menu")
dbGetQuery(con, "select * from pizza_menu")

dbGetQuery(con, "select a.pizza_name, 
                        a.pizza_size, 
                        a.pizza_cost, 
                        c.customer_name
           from pizza_menu as a
           join transaction as b
           on a.pizza_id = b.pizza_id
           join customer as c
           on b.customer_id = c.customer_id")

## Remove table
dbRemoveTable(con, "drink")

## close connection
dbDisconnect(con)
