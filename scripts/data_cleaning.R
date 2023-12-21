knitr::opts_chunk$set(echo = TRUE)
## download the library
options(repos = c(CRAN = "https://cran.rstudio.com"))
## activate the googlesheets4 library
library(tidyverse)
library(googlesheets4)
library(gsheet)
library(googledrive)
library(readr)
## Firstly, we define functions to clean the data
convert_na_to_zero <- function(data){
  result <- data %>% mutate_all(~ifelse(is.na(.), 0, .))
  return(result)
}
cleansed_df1 = read_csv(file='./data/cleansed_df1.csv', show_col_types = FALSE)
use_for_force_original = read_csv(file='./data/use_for_force_original.csv',show_col_types = FALSE)
use_for_force = read_csv(file='./data/use_for_force.csv',show_col_types = FALSE)
view(use_for_force)
## Read in Police Demo data
cop_demo = read_csv(file = './data/Officer_Demo_Data.csv',show_col_types = FALSE)
view(cop_demo)
demo = read_csv(file='./data/Officer_Demo_Data.csv',show_col_types = FALSE)
view(demo)
ori_lookup = read_csv(file='./data/ori_lookup.csv',show_col_types = FALSE)
library(tidyverse)
merged_df<-read_csv("data//merged_data.csv")
view(merged_df)

calculate_diversity_metrix <- function(proportions) {
  -sum(proportions * log(proportions, base = exp(1)), na.rm = TRUE) 
}
merged_df<-merged_df|>
  mutate(
    diversity_metrix=apply(select(merged_df, starts_with("percent_officers")), 1, calculate_diversity_metrix),
    .after=7
  )
