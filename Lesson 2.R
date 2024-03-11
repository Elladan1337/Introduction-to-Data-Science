# Key sources and acknowledgements:
# Nathaniel D. Phillips. (2018). YaRrr! The Pirate’s Guide to R.  https://bookdown.org/ndphillips/YaRrr/
# Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023). R for Data Science: Import, tidy, transform, visualize, and model data. O’Reilly. 
# https://r4ds.hadley.nz
# Without these publications the course would not be possible


# Part 3. Where we delve deeper -------------------------------------------
# Download our packages
install.packages("tidyverse")
install.packages("nycflights13")

# Load libraries
library("tidyverse")
library("nycflights13")

View(flights)

# Flights is a dataframe
# We like our data in this format, because it's easy to work with
# Our preferred way to work with this data is dplyr: http://127.0.0.1:21965/library/dplyr/doc/dplyr.html

# Rows:
#   filter() chooses rows based on column values.
#   slice() chooses rows based on location.
#   arrange() changes the order of the rows.
# Columns:
#   select() changes whether or not a column is included.
#   rename() changes the name of columns.
#   mutate() changes the values of columns and creates new columns.
#   relocate() changes the order of the columns.
# Groups of rows:
#   summarise() collapses a group into a single row.

# We do like to use the pipe operator %>%
# The pipe operator simply means "and then do the following"

# Behold:

# select() allows for only certain columns to be selected
select(flights, origin, dest) # selects only the airports of origin and destination
relocate(flights, dest) # makes dest to be the first column

# Now to combine them
relocate(select(flights, origin, dest), dest) # Hard to read? Now imagine there's 10 steps.

# Pipe to the rescue
flights %>%               
  select(origin, dest) %>%
  relocate(dest)

# Each line takes the output of the previous line as its input, proceeds with the verb

# This is nice, however, so often we want to look for data, by filtering
# And to filter, we have to understand BOOlean logic


# Boolean Logic -----------------------------------------------------------

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

! TRUE
! FALSE


# Expressions -------------------------------------------------------------

# Expressions are statements that evaluate either to TRUE or FALSE

1 == 1
1 != 1

"abc" == "cbc"
"abc" != "cbc"

# We can chain these expressions

1 == 1 & "abc" == "abc"
153 * 2 != 306 | sqrt(49) == 7

# Computers are not precise

0.1 + 0.2 == 0.3
print(0.1 + 0.2, digits = 20)

near(0.1 + 0.2, 0.3)






write.csv(flights, "flights.csv")
