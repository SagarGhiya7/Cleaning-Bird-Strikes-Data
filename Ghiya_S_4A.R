# Strategy:
# Firstly all the dates have been converted into months
# Date parsing done three times as there were dates of 3 different formats
# Now the entire list has only months in it
# Then converted into either of 6 levels

# Gap of 10,11 or 12 months, then "Year Round"
# Gap of 6,7,8 or 9 months, then "Half-Year"
# Now remaining values have been put into Spring, Summer, Fall and Winter based on starting month

# "Spring" if starting months were January, February or March
# "Summer" if starting months were April, May or June
# "Fall" if starting months were July, August or September
# "Winter" if starting months were October, November or December




# Loading package xlsx to read an excel file
library(xlsx)
# Reading excel file into R
# Since the dataset has been imported into R from file tab, it shows read_excel
# Command comes under console when file is imported
# Have copied into script to show the command
# It can be altered when running dataset on another PC
# Or simply it can be imported from file menu
a <- read_excel("C:/Users/Sagar Ghiya/Desktop/Study/SEM 2/Collecting Storing and Retrieving Data/Week 4/4A/2013 Geographric Coordinate Spreadsheet for U S  Farmers Markets 8'3'1013.xlsx",skip = 2)
# Q1
# Loading data file in a data frame
df <- data.frame(a)

# Q2
# Omitting missing values from Season1Date Column
df1 <- na.omit(df[, 9])
# Loading stringr package for string parsing
library(stringr)
# Calculates length of df1
len <- length(df1)
# for loop to replace missing end dates with NA
for (i in 1:len) {
  # str_split_fixed divides string into 2 parts according to the given seperator which is "to" in this case
  b <- str_split_fixed(df1[i], "to", 2)
  # Replace missing end dates with NA
  if (b[2] == "")
    df1[i] <- "NA"
}
# subset returns the rows without NA
# Thus rows with missing end dates removed

df2 <- subset(df1, df1 != "NA")
# Display df2
df2
# Calculates length of df2
len1 <- length(df2)
# Loading lubridate package for date parsing
library(lubridate)
# This for loop convertes date into months to have a column with uniform values
# for eg 01/02/2013 to 05/04/2013 is converted to January to May
for (j in 1:len1) {
  # str_split_fixed splits df2 into 2 strings
  c <- str_split_fixed(df2[j], " to ", 2)
  # This for loop is for two parts of the string
  for (k in 1:2) {
    # Extracts month number from date
    d <- month(as.Date(c[k], format = "%m/%d/%Y"))
    # Compares the month number extracted and assign apprpriate month value
    # Such as 1 gets January
    if (!is.na(d)) {
      if (d == 1) {
        c[k] = "January"
      }
      if (d == 2) {
        c[k] = "February"
      }
      if (d == 3) {
        c[k] = "March"
      }
      if (d == 4) {
        c[k] = "April"
      }
      if (d == 5) {
        c[k] = "May"
      }
      if (d == 6) {
        c[k] = "June"
      }
      if (d == 7) {
        c[k] = "July"
      }
      if (d == 8) {
        c[k] = "August"
      }
      if (d == 9) {
        c[k] = "September"
      }
      if (d == 10) {
        c[k] = "October"
      }
      if (d == 11) {
        c[k] = "November"
      }
      if (d == 12) {
        c[k] = "December"
      }
      
    }
  }
  # paste combines both parts of the string with the "to" seperator
  df2[j] <- paste(c[1], c[2], sep = " to ")
  
}
# There are dates with different formats and hence were not converted
# Following for loop is to convert them

for (n in 1:len1) {
  # String splited into 2
  h <- str_split_fixed(df2[n], " to ", 2)
  for (q in 1:2) {
    # Month number extracted
    d <- month(as.Date(h[q], format = "%B %d,%Y"))
    # Month number extracted above is compared and month value assigned accordingly
    # for eg month number 2 gets "February"
    if (!is.na(d)) {
      if (d == 1) {
        h[q] = "January"
      }
      if (d == 2) {
        h[q] = "February"
      }
      if (d == 3) {
        h[q] = "March"
      }
      if (d == 4) {
        h[q] = "April"
      }
      if (d == 5) {
        h[q] = "May"
      }
      if (d == 6) {
        h[q] = "June"
      }
      if (d == 7) {
        h[q] = "July"
      }
      if (d == 8) {
        h[q] = "August"
      }
      if (d == 9) {
        h[q] = "September"
      }
      if (d == 10) {
        h[q] = "October"
      }
      if (d == 11) {
        h[q] = "November"
      }
      if (d == 12) {
        h[q] = "December"
      }
      
    }
  }
  # Paste function again combines the string parts
  df2[n] <- paste(h[1], h[2], sep = " to ")
  
}

# Still there were a few more dates which had a different format from above ones
# Parsing those dates and coverting to months
# These dates had end as month name itself
# So first part of date is picked and converted into month name

for (n in 1:len1) {
  # String splited into 2 parts
  h <- str_split_fixed(df2[n], " to ", 2)
  # d gets month number for the specified format
  d <- month(as.Date(h[1], format = "%B %d , %Y"))
  # Compares month number as assigns month name to it
  # for eg month number 3 gets "March"
  if (!is.na(d)) {
    if (d == 1) {
      h[1] = "January"
    }
    if (d == 2) {
      h[1] = "February"
    }
    if (d == 3) {
      h[1] = "March"
    }
    if (d == 4) {
      h[1] = "April"
    }
    if (d == 5) {
      h[1] = "May"
    }
    if (d == 6) {
      h[1] = "June"
    }
    if (d == 7) {
      h[1] = "July"
    }
    if (d == 8) {
      h[1] = "August"
    }
    if (d == 9) {
      h[1] = "September"
    }
    if (d == 10) {
      h[1] = "October"
    }
    if (d == 11) {
      h[1] = "November"
    }
    if (d == 12) {
      h[1] = "December"
    }
    
  }
  # Paste function combines string
  
  df2[n] <- paste(h[1], h[2], sep = " to ")
  
}


# str_trim function removes white spaces from the string
# This makes entire list with month names uniform in terms of number of spaces in between

str_trim(df2, side = c("both", "left", "right"))

# Strategy

# If the gap is of 10,11 or 12 months, it is assigned as "Year Round"

# If the gap is of 6,7,8 or 9 months, "Half-Year" is assigned

# Year Round
for (k in 1:len1) {
  # String splitted into 2 parts
  e <- str_split_fixed(df2[k], " to ", 2)
  
  # Comparison of first and last parts of strings with month names to determine whether to assign Year Round or not
  # Comparison done for all 12 months as first part of string
  
  if ((e[1] == "January") &
      (e[2] == "December" | e[2] == "November" | e[2] == "October"))
    df2[k] <- "Year Round"
  if ((e[1] == "February") &
      (e[2] == "January" | e[2] == "December" | e[2] == "November"))
    df2[k] <- "Year Round"
  if ((e[1] == "March") &
      (e[2] == "January" | e[2] == "December" | e[2] == "February"))
    df2[k] <- "Year Round"
  if ((e[1] == "April") &
      (e[2] == "January" | e[2] == "March" | e[2] == "February"))
    df2[k] <- "Year Round"
  if ((e[1] == "May") &
      (e[2] == "April" | e[2] == "March" | e[2] == "February"))
    df2[k] <- "Year Round"
  if ((e[1] == "June") &
      (e[2] == "May" | e[2] == "April" | e[2] == "March"))
    df2[k] <- "Year Round"
  if ((e[1] == "July") & (e[2] == "June" |
                          e[2] == "May" | e[2] == "April"))
    df2[k] <- "Year Round"
  if ((e[1] == "August") &
      (e[2] == "July" | e[2] == "June" | e[2] == "May"))
    df2[k] <- "Year Round"
  if ((e[1] == "September") &
      (e[2] == "August" | e[2] == "July" | e[2] == "June"))
    df2[k] <- "Year Round"
  if ((e[1] == "October") &
      (e[2] == "September" | e[2] == "August" | e[2] == "July"))
    df2[k] <- "Year Round"
  if ((e[1] == "November") &
      (e[2] == "October" | e[2] == "September" | e[2] == "August"))
    df2[k] <- "Year Round"
  if ((e[1] == "December") &
      (e[2] == "November" | e[2] == "October" | e[2] == "September"))
    df2[k] <- "Year Round"
  
  # Half-Year
  
  # Comparison done for all 12 months as first part of string for half year
  
  if ((e[1] == "January") &
      (e[2] == "June" | e[2] == "July" |
       e[2] == "August" | e[2] == "September"))
    df2[k] <- "Half-Year"
  if ((e[1] == "February") &
      (e[2] == "July" |
       e[2] == "August" | e[2] == "September" | e[2] == "October"))
    df2[k] <- "Half-Year"
  if ((e[1] == "March") &
      (e[2] == "August" |
       e[2] == "September" | e[2] == "October" | e[2] == "November"))
    df2[k] <- "Half-Year"
  if ((e[1] == "April") &
      (e[2] == "September" |
       e[2] == "October" | e[2] == "November" | e[2] == "December"))
    df2[k] <- "Half-Year"
  if ((e[1] == "May") &
      (e[2] == "October" |
       e[2] == "November" | e[2] == "December" | e[2] == "January"))
    df2[k] <- "Half-Year"
  if ((e[1] == "June") &
      (e[2] == "November" |
       e[2] == "December" | e[2] == "January" | e[2] == "February"))
    df2[k] <- "Half-Year"
  if ((e[1] == "July") &
      (e[2] == "December" |
       e[2] == "January" | e[2] == "February" | e[2] == "March"))
    df2[k] <- "Half-Year"
  if ((e[1] == "August") &
      (e[2] == "January" |
       e[2] == "February" | e[2] == "March" | e[2] == "April"))
    df2[k] <- "Half-Year"
  if ((e[1] == "September") &
      (e[2] == "February" | e[2] == "March" | e[2] == "April" |
       e[2] == "May"))
    df2[k] <- "Half-Year"
  if ((e[1] == "October") &
      (e[2] == "March" | e[2] == "April" | e[2] == "May" |
       e[2] == "June"))
    df2[k] <- "Half-Year"
  if ((e[1] == "November") &
      (e[2] == "April" | e[2] == "May" | e[2] == "June" | e[2] == "July"))
    df2[k] <- "Half-Year"
  if ((e[1] == "December") &
      (e[2] == "May" | e[2] == "June" | e[2] == "July" | e[2] == "August"))
    df2[k] <- "Half-Year"
  
}

# end of loop
# Assignment complete for half year and year round

# Now remaining values to beassigned as Spring, Summer, Fall and winter

# Months starting with Jan,Feb and March as "Spring"
# Months starting with April, May, June as "Summer"
# Months starting with JUly, Aug and Sept as "Fall"
# Months starting with Oct, Nov and Dec as "Winter"

# for loop for task mentioned above from 1 to length of list
for (m in 1:len1) {
  # String splitted into 2 parts
  f <- str_split_fixed(df2[m], " to ", 2)
  # Below are comparisons of first part of string to assign either of the season to them
  if (f[1] == "January" | f[1] == "February" | f[1] == "March")
    df2[m] <- "Spring"
  if (f[1] == "April" | f[1] == "May" | f[1] == "June")
    df2[m] <- "Summer"
  if (f[1] == "July" | f[1] == "August" | f[1] == "September")
    df2[m] <- "Fall"
  if (f[1] == "October" | f[1] == "November" | f[1] == "December")
    df2[m] <- "Winter"
}
# Display df2
# df2 contains column Season1Date converted into 6 levels
# Each value in df2 is from either of the six levels
df2

# Q3
# Loading dplyr in order to use filter for data manipulation
library(dplyr)

acceptsWIC <- function(dafr) {
  # Function to return data frame with only markets that accept WIC
  # Args: accepts the data frame created at begining after importing the dataset
  
  # Filtering of markets that accept WIC
  fit <- filter(dafr, dafr[, 21] == 'Y')
  # Now fit contains data frame of only those markets that accept WIC
  # Data frame returned
  return(fit)
}

# Function calling
x <- acceptsWIC(df)
# Display data frame x with markets that accept WIC
x

