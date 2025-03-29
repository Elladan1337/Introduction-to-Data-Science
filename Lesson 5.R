#So far, we have only been looking at nice datasets from libraries
#How does this compare to real life? It depends...

# Let's look at two datasets
# https://data.gov.cz/datov%C3%A1-sada?iri=https%3A%2F%2Fdata.gov.cz%2Fzdroj%2Fdatov%C3%A9-sady%2F00025429%2F1493899967
# https://data.gov.cz/datov%C3%A1-sada?iri=https%3A%2F%2Fdata.gov.cz%2Fzdroj%2Fdatov%C3%A9-sady%2F00025429%2F1493900249

library(tidyverse)
install.packages("readxl")
library(readxl)
library(nycflights13)
tlum <- read_excel("/Users/makosatka/Desktop/Programování/DS 2025/tlum.xlsx", guess_max = 6000)
tlum2 <- read_csv2("tlumocnici.csv")

#Loading in methods

prekladatele <- tlum %>% filter(`Druh osoby` == "Soudní překladatel") %>%
  separate_longer_delim(cols = Jazyky, delim = "|") %>%
  group_by(Jazyky) %>%
  summarize(Počet = n())

# Separating out languages to keep the rule of 1 observation per row

ggplot(prekladatele, aes(x = Jazyky, y = Počet)) +
  geom_col(fill = "skyblue", color = "black") +  # Bar plot with colors
  theme_minimal() +  # Clean theme
  labs(title = "Language Frequency", x = "Languages", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate labels

ggplot(prekladatele, aes(x = reorder(Jazyky, Počet), y = Počet, fill = Jazyky)) +
  geom_col(color = "black", width = 0.6) +  # Stylish blue bars
  theme_minimal(base_size = 15) +  # Clean theme, larger text
  labs(title = "Language Frequency", x = "Languages", y = "Count") +
  coord_flip() +  # ✅ Makes bars VERTICAL!
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 18),  # Center title, bold
    axis.text.y = element_text(size = 12),  # Readable labels
    axis.text.x = element_text(size = 12),
    axis.title = element_text(face = "bold")
  )
#Visualizing it

cro <- read_csv("cro.csv")

#Searching for JUDr. degrees, and making it case-sensitive
cro %>% 
  filter(grepl(pattern = "JUDr.", x = tituly, ignore.case = TRUE)) %>%
  nrow()

cro %>%
  group_by(tituly) %>%
  summarize(n()) %>%
  filter(tituly == "JUDr.")


#Searching for the average number of Mgr. degrees
cro %>%
  filter(grepl(pattern = "Mgr", x = tituly, ignore.case = TRUE)) %>%
  mutate(mgr_count = str_count(tituly, pattern ="[M|m][G|g][R|r]")) %>%
  summarize(mean(mgr_count, na.rm = TRUE))
