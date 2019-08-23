# ETL Report for PGA Player Statistics 2010-2019

* John Plakon

* Jacob Nolff

## Introduction

This report describes the process for acquiring and formatting the PGA Tour player statistics for the years 2010-2019.

Included in the database that has been built is player name, year, rounds, average score, wins, top 10, points, fairway percentage, average drive distance, greens in regulation percentage, scrambling percentage, average strokes gained from putting, average strokes gained off the tee, average strokes gains approaching the green, average strokes gained total, and earnings.

## Extraction

Our first source of data was extracted from Kaggle in CSV format.  This file contained the player statistics for the PGA Tour from 2010-2018.  Our second source was extracted from the PGA Tour website, which was in HTML format.  We used the website to scrape the player statistics for the 2019 PGA Tour up through the BMW Championship, which ended August 18, 2019.

## Transform

At first, we tried to simply use BeautifulSoup to scrape the statistics pages but realized that the PGA Tour website did not allow that to be done in a way that we knew how to do.  So after doing some research about various ways to scrape from the website, we learned that we had to basically create lists to hold the column headers.  In order to do that, we chose to create functions to perform each step of the process.  Our first function allowed us to grab the column headers from the stats table on each webpage we scraped.  The second one we used to grab the player names from each stats table.  Then, we created a function to make a list of all the stat values within the stats table (not including player names or column headers).  The fourth function would match the player in the player list with the appropriate stats from his row and then place the result into a dictionary with the players' names as the key and the stats as the values.  Our final funciton just combined all four of our funcitons into one that could be used for each url we had to scrape and then transform our dictionary into a pandas dataframe.  Once we scraped all the urls that we needed, we renamed/rearranged all the columns and saved the dataframe as a CSV file.  The CSV file from Kaggle was much simpler.  We first did a basic clean in Excel by dropping the rows at the bottom of the file which had a bunch of zeros in their stats columns due to not playing in enough tournaments.  We then imported the CSV file in jupyter lab as a dataframe.  We renamed/rearranged the columns to match our 2019 dataframe and then saved it as a CSV file.

## Load

We used Postgres to create the frameworks for our two CSV files by naming the column variables(the variables mentioned in the introduction) with their respective data type.  We imported each CSV into its respective table and then performed a union on both tables.  The union basically stacked the  2019 table on top of the  2010-2018 table and we ordered it by year in descending order.  We had initially tried to use sqlalchemy to import the two dataframes into Postgres but we kept running into errors so we chose the CSV route.

