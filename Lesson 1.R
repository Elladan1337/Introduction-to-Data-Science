# Key sources and acknowledgements:
# Nathaniel D. Phillips. (2018). YaRrr! The Pirate’s Guide to R.  https://bookdown.org/ndphillips/YaRrr/
# Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023). R for Data Science: Import, tidy, transform, visualize, and model data. O’Reilly. 
# https://r4ds.hadley.nz
# Without these publications the course would not be possible


# Part 1. The Big Picture -------------------------------------------------

# Installs the yarrr package. Packages are extensions that expand our possibilities.
# They do so mainly by adding functions (explained later). Now we however use it for data.
# You only have to install a package once.
install.packages('yarrr')

# Load the package
library(yarrr)

# Look at the first few rows of the data
head(pirates)

# What are the names of the columns?
names(pirates)

# View the entire dataset in a new window
View(pirates)

# Documentation
?pirates

