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

Col1b <- Col1 %>% 
  group_by(X1) %>% 
  mutate(X1_freq = n()) %>% 
  ungroup()

Col2b <- Col2 %>% 
  group_by(X4) %>% 
  mutate(X4_freq = n()) %>% 
  ungroup()

Part2_df <- Col1b %>% 
  left_join(Col2b %>% distinct(), by = c("X1" = "X4")) %>% 
  mutate(X5 = X1 * X4_freq)

Part2_Total <- sum(Part2_df$X5, na.rm = TRUE)

print(Part2_Total)
