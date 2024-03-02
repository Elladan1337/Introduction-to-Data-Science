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

# What is the mean age?
mean(pirates$age)

# What was the tallest pirate?
max(pirates$height)

# How many pirates are there of each sex?
table(pirates$sex)

# Calculate the mean age, separately for each sex
aggregate(x = age ~ sex,
          data = pirates,
          FUN = mean)

# But should it not be gender instead?
# What to do?
colnames(pirates)[colnames(pirates) == "sex"] <- "gender"
View(pirates)
# WHAT?!
# This is the code that you can find by google (or generated)
# But you don't understand it, which is a problem - if anything goes wrong


# Let's see what we've got ------------------------------------------------

# Create a basic scatterplot
plot(x = pirates$height,        # X coordinates
     y = pirates$weight)        # y-coordinates

# Create a nicer scatterplot
plot(x = pirates$height,        # X coordinates
     y = pirates$weight,        # y-coordinates
     main = 'My first scatterplot of pirate data!',
     xlab = 'Height (in cm)',   # x-axis label
     ylab = 'Weight (in kg)',   # y-axis label
     pch = 16,                  # Filled circles
     col = gray(.0, .1))        # Transparent gray

# Create a very nice scatterplot
plot(x = pirates$height,        # X coordinates
     y = pirates$weight,        # y-coordinates
     main = 'My first scatterplot of pirate data!',
     xlab = 'Height (in cm)',   # x-axis label
     ylab = 'Weight (in kg)',   # y-axis label
     pch = 16,                  # Filled circles
     col = gray(.0, .1))        # Transparent gray

grid()        # Add gridlines

# Create a linear regression model
model <- lm(formula = weight ~ height, 
            data = pirates)

abline(model, col = 'blue')      # Add regression to plot

# Create a kind of boxplot called "Pirateplot"
pirateplot(formula = age ~ sword.type, 
           data = pirates,
           main = "Pirateplot of ages by favorite sword")

pirateplot(formula = height ~ gender,               # Plot weight as a function of gender
           data = pirates,                       
           main = "Pirateplot of height by gender",
           pal = "pony",                         # Use the info color palette
           theme = 3)                            # Use theme 3

# Into hypothesis testing -------------------------------------------------

# Age by headband t-test
t.test(formula = age ~ headband,
       data = pirates,
       alternative = 'two.sided')

#Height - Weight correlation test
cor.test(formula = ~ height + weight,
         data = pirates)


# Create tattoos model
tat.sword.lm <- lm(formula = tattoos ~ sword.type,
                   data = pirates)

# Get ANOVA table
anova(tat.sword.lm)

# Create a linear regression model: DV = tchests, IV = age, weight, tattoos
tchests.model <- lm(formula = tchests ~ age + weight + tattoos,
                    data = pirates)

# Show summary statistics
summary(tchests.model)


# Part 2. Where we start comprehending what we just did -------------------


