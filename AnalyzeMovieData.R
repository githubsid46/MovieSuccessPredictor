#Import library files
library(readxl,quietly = TRUE)
library(dplyr,quietly = TRUE)
library(tidyr, quietly = TRUE)
library(WriteXLS, quietly = TRUE)

#Pull the Movie Data file
movieData <- read_xls("/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/movies_1_10000.xls")

# Removing movies with 0 Revenue or Budget values
new_MovieData <- (movieData[!(movieData$budget==0 | movieData$revenue==0),])
head(new_MovieData)
