#Import library files
library(readxl,quietly = TRUE)
library(dplyr,quietly = TRUE)
library(tidyr, quietly = TRUE)
library(WriteXLS, quietly = TRUE)
library(stringr)

#Pull the Movie Data file
movieData <- read_xls("/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/movies_1_10000.xls")
movieCast <- read_xlsx("/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/cast_1_10000.xls")
castRating <- read_xlsx("/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/cast_rating-1_10000--1.xls")
  
#Display all data frames
str(movieData)
str(movieCast)
str(castRating)

print(paste("Total movies :: ", nrow(movieData)))

# Removing movies with 0 Revenue or Budget values
new_MovieData <- (movieData[!(movieData$budget==0 | movieData$revenue==0),])

print(paste("Total movies after removing invalid rows :: ", nrow(new_MovieData)))

#Remove rows from Cast for movies that are present in 
new_movieCast <- movieCast %>% filter(movie_id %in% unique(new_MovieData$id))

#Remove rows from Cast Ratings where cast_id and movie_id don't belong
new_castRating <- castRating %>% filter(movie_id %in% unique(new_MovieData$id))


WriteXLS(new_MovieData, ExcelFileName = "/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/clean/movies.xlsx")
WriteXLS(new_movieCast, ExcelFileName = "/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/clean/cast.xlsx")
WriteXLS(new_castRating, ExcelFileName = "/Users/siddharthsingh/Documents/DataScience/Capstone Project/MoviePredictor/Data/clean/cast_rating.xlsx")
