# 1 - Introduction -------------------------------------------------------------
# 1.3 - Loading the tidyverse

# 1.4 - The gapminder dataset

# 2 - select() to pick columns (variables) -------------------------------------

# 3 - rename() to change column names ------------------------------------------

# 4 - The pipe |> --------------------------------------------------------------

# 5 - filter() to pick rows (observations) -------------------------------------

# Challenge 1
# Write a single command (which can span multiple lines and include pipes) that
# will produce a data frame that has lifeExp, country, and year for Africa but not
# for other continents.
# How many rows does your data frame have?

# 6 - arrange() to sort data frames --------------------------------------------

# 7 - mutate() to modify values in columns and create new columns --------------

# Challenge 2
# A: Use mutate() to create a new column called gdp_billion that has the absolute
#    GDP (i.e., not relative to population size) and does so in units of billions
#    (i.e., 2.3 would mean 2.3 billion).

# B: (Bonus) Use mutate() to create a new column planet that has the value earth
#    in every row. We didn’t cover this kind of scenario but go ahead and test 
#    your intuition!
  
# 8 - summarize() to compute group-wise summary stats --------------------------

# Challenge 3
# Calculate the average life expectancy per country. Which has the longest average
# life expectancy and which has the shortest average life expectancy?
