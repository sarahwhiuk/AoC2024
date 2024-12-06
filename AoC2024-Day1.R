# Advent of Code #
#### Day 1 ####

# Library
library(tidyverse)

##### Example #####
Example_df_raw <- read_delim("Day1-Example.txt", col_names = FALSE)

Ex_Col1 <- Example_df_raw %>% select(X1) %>% arrange(desc(X1))
Ex_Col2 <- Example_df_raw %>% select(X4) %>% arrange(desc(X4))

Example_df <- data.frame(Ex_Col1, Ex_Col2) %>% 
  mutate(X5 = abs(X1 - X4))

Example_Total <- sum(Example_df$X5)

print(Example_Total)

rm(Ex_Col1, Ex_Col2, Example_df, Example_df_raw)

#### Part 1 ####
Part1_df_raw <- read_delim("Day1-Part1.txt", col_names = FALSE)

Col1 <- Part1_df_raw %>% select(X1) %>% arrange(desc(X1))
Col2 <- Part1_df_raw %>% select(X4) %>% arrange(desc(X4))

Part1_df <- data.frame(Col1, Col2) %>% 
  mutate(X5 = abs(X1 - X4))

Part1_Total <- sum(Part1_df$X5)

print(Part1_Total)

