library(tidyverse)

#loan_data <- read_csv(here::here("dataset", "loan_refusal.csv"))

## CLEAN the data
#loan_data_clean <- loan_data

#write_csv(loan_data_clean, file = here::here("dataset", "loan_refusal_clean.csv"))

#save(loan_data_clean, file = here::here("dataset/loan_refusal.RData"))

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

# ####
# ```{r setup, include=FALSE}
# knitr::opts_chunk$set(echo = TRUE)
# ```
# 
# 
# ## download the library
# ```{r cars}
# 
# options(repos = c(CRAN = "https://cran.rstudio.com"))
# 
# #install.packages("googlesheet4")
# #install.packages("googledrive")
# #install.packages("gsheet")
# #install.packages("readr")
# ```
# ## activate the googlesheets4 library
# ```{r}
# library(tidyverse)
# library(googlesheets4)
# library(gsheet)
# library(googledrive)
# library(readr)
# 
# ```
# ## Firstly, we define functions to clean the data
# ```{r}
# convert_na_to_zero <- function(data){
#   result <- data %>% mutate_all(~ifelse(is.na(.), 0, .))
#   return(result)
# }
# 
# ```
# 
# 
# ## The dataset is Fact checking.xlsx, including 12 data sheets
# ### 1.1
# ```{r}
# # civilian_complaints_id<- "https://docs.google.com/spreadsheets/d/1AJFk9ILwxg2oJEDP4xj0C9Qi9lZLJNnxKG5NNPO__GA/edit#gid=121254631"
# # civilian_complaints<-read_sheet(civilian_complaints_id,
# #                                    na=c(" ","N/A","NA"))
# ```
# 
# ```{r}
# #Cleans the data
# # head(civilian_complaints)
# # glimpse(civilian_complaints)
# # summary(civilian_complaints)
# # 
# # cleansed_df1<-civilian_complaints|>
# #   janitor::clean_names()|>
# #   mutate(
# #     yers_of_complaints=as.Date(paste(years_of_complaints_data,sep="-"),format="%Y-%m-%d")
# #   )|>
# #   select(c(police_department,state,ori,civilian_complaints_sustained_2020,civilian_complaints_reported_2020,discrimination_complaints_reported_2020,discrimination_complaints_sustained_2020))|>
# #   mutate(
# #    civilian_complaints_sustained_2020=if_else(is.na(civilian_complaints_sustained_2020),0,civilian_complaints_sustained_2020),
# #    discrimination_complaints_reported_2020=if_else(is.na(discrimination_complaints_reported_2020),0,discrimination_complaints_reported_2020),
# #     discrimination_complaints_sustained_2020=if_else(is.na(discrimination_complaints_sustained_2020),0,discrimination_complaints_sustained_2020)
# #     
# #   )
# #   
# # 
# # summary(cleansed_df1)
# # colnames(cleansed_df1)[colnames(cleansed_df1) == "ori"] <- "ORI"
# # write.csv(cleansed_df1, file='./data/cleansed_df1.csv', row.names = FALSE)
# cleansed_df1 = read_csv(file='./data/cleansed_df1.csv', show_col_types = FALSE)
# 
# ```
# 
# ### 1.2
# ```{r}
# # use_for_force_original <-"https://docs.google.com/spreadsheets/d/1AJFk9ILwxg2oJEDP4xj0C9Qi9lZLJNnxKG5NNPO__GA/edit#gid=1000577163"
# # use_for_force_original <- read_sheet(use_for_force_original,sheet = 'Use of Force Data',na=c(" ","N/A","NA"))
# # use_for_force_original
# # colnames(use_for_force_original)[colnames(use_for_force_original) == "2020 Total \"Less Lethal Force\""] <- "Total_Less_lethal_force_2020"
# # write.csv(use_for_force_original, file='./data/use_for_force_original.csv', row.names = FALSE)
# ```
# 
# ```{r}
# # # # Keep only the columns matching the pattern
# #  use_for_force <- use_for_force_original %>%
# #    select("Total_Less_lethal_force_2020", "ORI","Population","Police Department")
# #  print(use_for_force)
# #  write.csv(use_for_force, file='./data/use_for_force.csv', row.names = FALSE)
# use_for_force_original = read_csv(file='./data/use_for_force_original.csv',show_col_types = FALSE)
# use_for_force = read_csv(file='./data/use_for_force.csv',show_col_types = FALSE)
# view(use_for_force)
# ```
# 
# ```{r}
# ## Read in Police Demo data
# cop_demo = read_csv(file = './data/Officer_Demo_Data.csv',show_col_types = FALSE)
# view(cop_demo)
# ```
# 
# ```{r}
# demo = read_csv(file='./data/Officer_Demo_Data.csv',show_col_types = FALSE)
# view(demo)
# ```
# 
# 
# ### 1.3 Reference
# ```{r}
# # ori_lookup <- "https://docs.google.com/spreadsheets/d/1AJFk9ILwxg2oJEDP4xj0C9Qi9lZLJNnxKG5NNPO__GA/edit#gid=1179583443"
# # ori_lookup <- read_sheet(ori_lookup, sheet = 'ORI Lookup',na=c(" ","N/A","NA"))
# # head(ori_lookup)
# ```
# 
# ```{r}
# #convert all N/A data to 0
# # ori_lookup = convert_na_to_zero(ori_lookup)
# # head(ori_lookup)
# # write.csv(ori_lookup, file='./data/ori_lookup.csv', row.names = FALSE)
# ori_lookup = read_csv(file='./data/ori_lookup.csv',show_col_types = FALSE)
# ```
# 
# 
# 
# ```{r Merged Data Load and transformation} 
# library(tidyverse)
# merged_df<-read_csv("data//merged_data.csv")
# view(merged_df)
# 
# calculate_diversity_metrix <- function(proportions) {
#   -sum(proportions * log(proportions, base = exp(1)), na.rm = TRUE)
# }
# merged_df<-merged_df|>
#   mutate(
#     diversity_metrix=apply(select(merged_df, starts_with("percent_officers")), 1, calculate_diversity_metrix),
#     .after=7
#   )
# ```
# #####