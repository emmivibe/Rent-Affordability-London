# install necessary packages
install.packages("tidyverse")
# readxl, dplyr, tidyr, writexl


# Load the necessary libraries
library(readxl)
library(dplyr)
library(tidyr)
library(writexl)


## SHEET 1##
# Read the first sheet of the Excel file 
df <- read_excel("earnings_london.xlsx", sheet = "Total, Weekly")
df1 <- read_excel("earnings_london.xlsx", sheet = "Full-time, Weekly")
df2 <- read_excel("earnings_london.xlsx", sheet = "Part-time, Weekly")
df3 <- read_excel("earnings_london.xlsx", sheet = "Male, Weekly")
df4 <- read_excel("earnings_london.xlsx", sheet = "Female, Weekly")


# Print the first 20 Row of the dataframe 'df' 
head(df, 20)

# Print the last 20 Row of the dataframe 'df'
tail(df, 20)

# Open the dataframe in the RStudio's data viewer for inspection
View(df)

# Create a new dataframe 'df_rounded' from 'df' where numeric columns are rounded to 1 decimal place
df_rounded <- df %>% 
  mutate_if(is.numeric, round, digits = 1)

# Display the structure of the dataframe to get the data type
str(df)

# delete the first row of the dataset
df <- df[-1, ]

# View the modified dataset
View(df)

# Convert all columns in 'df' except 'Area' to numeric type and round to 1 decimal place
df <- df %>%
  mutate(across(-Area, ~ round(as.numeric(.), 1)))

#View the modified dataset for inspection
View(df)


# Reshape the 'df' dataframe to a long format where column names become values in a new 'Year' column
# and the values themselves become values in a new 'Pay (£)' column

long_df <- df %>%
  pivot_longer(
    cols = -Area, # Selects all columns except for Area to pivot
    names_to = "Year", 
    values_to = "Pay (£)"
  )



# Print the first 20  rows of the reshaped dataframe
head(long_df, 20)

# Print the last 20  rows of the reshaped dataframe
tail(long_df, 20)

View(long_df)

# Check for null values in each column
sapply(long_df, function(x) sum(is.na(x)))


## SHEET 2##

# Open the dataframe in the RStudio's data viewer for inspection 
View(df1)

# Print the first 20 row of the dataset df1
head(df, 20)

# Print the last 20 rows of the dataset df1
tail(df, 20)


# Create a new dataframe 'df_rounded' from 'df1' where numeric columns are rounded to 1 decimal place
df_rounded1 <- df1 %>% 
  mutate_if(is.numeric, round, digits = 1)

# data type
str(df1)

# Delete first row
df1 <- df1[-1, ]


# View modified data for inspection
View(df1)

# Convert all columns except 'Area' to numeric type and round to 1 decimal place
df1 <- df1 %>%
  mutate(across(-Area, ~ round(as.numeric(.), 1)))

# View modified data for inspection
View(df1)

# Reshape the 'df1' dataframe to a long format where column names become values in a new 'Year' column
# and the values themselves become values in a new 'Pay (£)' column
long_df1 <- df1 %>%
  pivot_longer(
    cols = -Area, # Selects all columns except for Area to pivot
    names_to = "Year", 
    values_to = "Pay (£)"
  )



# Print the first 20 rows of the reshaped dataframe
head(long_df1, 20)

# Print the last 20 Row of teh reshaped dataframe
tail(long_df1, 20)

View(long_df1)

# Check for null values in each column
sapply(long_df1, function(x) sum(is.na(x)))

## SHEET 3
# Print the first 5 rows of the dataframe 'df2'
head(df2)

# Print the last 5 rows of the dataframe 'df2' 
tail(df2)

# Open the dataframe 'df2' in the RStudio's data viewer for inspection
View(df2)

# Display the structure of the dataframe to get column data types
str(df2)

# Remove the first row of 'df2' containing non-numeric header
df2 <- df2[-1, ]

# View the modified dataframe
View(df2)

# Convert all columns in 'df2' except 'Area' to numeric type and round to 1 decimal place
df2 <- df2 %>%
  mutate(across(-Area, ~ round(as.numeric(.), 1)))

# Open the further modified 'df2' dataframe in the RStudio's data viewer for inspection
View(df2)

# Reshape the 'df2' dataframe to a long format where column names become values in a new 'Year' column
# and the values themselves become values in a new 'Pay (£)' column
long_df2 <- df2 %>%
  pivot_longer(
    cols = -Area, # Selects all columns except for Area to pivot
    names_to = "Year", 
    values_to = "Pay (£)"
  )

# Print the first 20 rows of the reshaped dataframe 'long_df1' to the console
head(long_df2, 20)


# Apply a function across all columns of 'long_df2' to sum up the number of NA (null) values in each column
sapply(long_df2, function(x) sum(is.na(x)))

# Inspect further
View(long_df2)

# Fill the null values with the Last Observation (Forward Fill)
long_df2 <- long_df2 %>%
  fill(everything(), .direction = "down")

# Check for null values again
sapply(long_df2, function(x) sum(is.na(x)))



## SHEET 4

# Print the first 20 rows of the dataframe 'df3'
head(df3, 20)

# Print the last 20 rows of the dataframe 'df3' 
tail(df3, 20)

# Open the dataframe 'df2' in the RStudio's data viewer for inspection
View(df2)

# Display the structure of the dataframe to get column data types
str(df2)

# Remove the first row of 'df3' containing non-numeric header
df3 <- df3[-1, ]

# View the modified dataframe
View(df3)

# Convert all columns in 'df3' except 'Area' to numeric type and round to 1 decimal place
df3 <- df3 %>%
  mutate(across(-Area, ~ round(as.numeric(.), 1)))

# Open the modified 'df3' dataframe for inspection
View(df3)

# Reshape the 'df3' dataframe to a long format where column names become values in a new 'Year' column
# and the values themselves become values in a new 'Pay (£)' column
long_df3 <- df3 %>%
  pivot_longer(
    cols = -Area, # Selects all columns except for Area to pivot
    names_to = "Year", 
    values_to = "Pay (£)"
  )

# Print the first 20 rows of the reshaped dataframe 'long_df1' to the console
head(long_df3, 20)


# Apply a function across all columns of 'long_df2' to sum up the number of NA (null) values in each column
sapply(long_df3, function(x) sum(is.na(x)))


# Fill the null values with the Last Observation (Forward Fill)
long_df3 <- long_df3 %>%
  fill(everything(), .direction = "down")

# Check for null values again
sapply(long_df2, function(x) sum(is.na(x)))


## SHEET 4

# Print the first 5 rows of the dataframe 'df4'
head(df4)

# Print the last 5 rows of the dataframe 'df4' 
tail(df4)

# Open the dataframe 'df4' in the RStudio's data viewer for inspection
View(df4)

# Display the structure of the dataframe to get column data types
str(df4)

# Remove the first row of 'df4' containing non-numeric header
df4 <- df4[-1, ]

# View the modified dataframe
View(df4)

# Convert all columns in 'df4' except 'Area' to numeric type and round to 1 decimal place
df4 <- df4 %>%
  mutate(across(-Area, ~ round(as.numeric(.), 1)))

# Open the further modified 'df4' dataframe in the RStudio's data viewer for inspection
View(df4)

# Reshape the 'df4' dataframe to a long format where column names become values in a new 'Year' column
# and the values themselves become values in a new 'Pay (£)' column
long_df4 <- df4 %>%
  pivot_longer(
    cols = -Area, # Selects all columns except for Area to pivot
    names_to = "Year", 
    values_to = "Pay (£)"
  )

# Print the first 20 rows of the reshaped dataframe 'long_df1' to the console
head(long_df4, 20)


# Apply a function across all columns of 'long_df2' to sum up the number of NA (null) values in each column
sapply(long_df4, function(x) sum(is.na(x)))

# Inspect further
View(long_df4)

# Create a list with each data frame as an element of the list

list_of_dfs <- list(
  Sheet1 = long_df,
  Sheet2 = long_df1,
  Sheet3 = long_df2,
  Sheet4 = long_df3,
  Sheet5 = long_df4
)

# Write the list to an xlsx file
write_xlsx(list_of_dfs, path = "earnings_london_clean.xlsx")



## LET'S ALSO READ THE REAL ESTATE DATASET PERFORM SOME DATA WRANGLING AND CLEANING

dataset <- read_excel("REAL_ESTATE_DATASET_LONDON_BOROUGHS.xlsx")

# View the first 5 rows of the dataset
head(dataset)
#View the last 20 rows of the dataset
tail(dataset, 20)

# Open the dataframe in the RStudio's data viewer for inspection
View(dataset)


# Let's delete all columns with url
dataset <- dataset %>%
  select(-c(Address_url, Address_Price_url, Address_Property_type_url, Address_Bedrooms_url, Address_Bathrooms_url))

# View the first 5 rows of the modified dataframe for inspection
head(dataset)

# let's remane the columns with their appropriate names removing
dataset_renamed <- dataset %>%
  rename(
    Address = Address_name,
    Price = Address_Price,
    Property_type = Address_Property_type,
    Bedrooms = Address_Bedrooms,
    Bathrooms = Address_Bathrooms
  )


#View the first 5 row of the modified dataset
head(dataset_renamed)

# Next let us clean up the 'Price' column and keep only the numbers
dataset_renamed$Price <- gsub("[^0-9]", "", dataset_renamed$Price)

head(dataset_renamed)


# Convert 'Price'column to numeric for calculation
dataset_renamed$Price <- as.numeric(dataset_renamed$Price)

head(dataset_renamed)

# Display the structure of the dataframe to get column data types
str(dataset_renamed)

# Convert monthly Price to Weekly, 
#to match up with the weekly employee earning dataset and rename accordingly

dataset_renamed$Price_weekly <- dataset_renamed$Price / 4

head(dataset_renamed)

# Let's delete the 'Price' column
dataset_renamed <- dataset_renamed %>%
  select(-c(Price))

head(dataset_renamed)

# Apply a function across all columns of 'long_df2' to sum up the number of NA (null) values in each column
sapply(dataset_renamed, function(x) sum(is.na(x)))

# Let us forward fill the Price and Address 

dataset_clean <- dataset_renamed %>%
  fill(Address, Price_weekly, .direction = "down")

# Let us also fill the Bedrooms and Bathrooms with 1; 
# Reason being that every poperty_type should have at least a bedroom and a bathroom

dataset_clean[is.na(dataset_clean)] <- 1

# Apply a function across all columns of 'long_df2' to sum up the number of NA (null) values in each column
sapply(dataset_clean, function(x) sum(is.na(x)))

head(dataset_clean)

# View the modified dataframe 'dataset_clean'
View(dataset_clean)

# Save the cleaned dataset to an xlsx file
write_xlsx(dataset_clean, path = "real_estatedata_CLEAN.xlsx")


# Save my entire workspace
save.image(file = "Complete_data_cleaning.RData")
