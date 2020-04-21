library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

#read in data
gdpr_violations <- read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-21/gdpr_violations.tsv')
gdpr_text <-read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-21/gdpr_text.tsv')

#collapse the column of all the articles violated into one string separated by "|" (which is what seperates multipla articles in the same row in the data)
articles <- paste(gdpr_violations$article_violated, collapse = "|")

#make a dataframe where each element of the object returned by splitting the above string (articles) by the "|" character.
articles_df <- data.frame(articles = as.list(strsplit(articles, "\\|")[[1]]))

# create clean dataframe with one column that contains every article instance
articles_df <- articles_df %>% 
  mutate(n = c(1:nrow(.))) %>%  
  pivot_longer(-n) %>% 
  select(value) %>% 
  mutate(value = trimws(value, which = "both"))

#count the number of times each article occurs and use this to create a dataframe with a column for each article and n for number of times they appear
articles_df <- articles_df %>% 
  group_by(value) %>% 
  count() %>% 
  arrange(-n) %>%  #arrange descending
  head(n = 10)     #pick top 10


#plot
ggplot(articles_df, aes(x = reorder(value, n), y = n)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  xlab("") + 
  ylab("Number of violations") + 
  labs(title = "Number of violations of the top 10 most violated articles of GDPR",
        subtitle = "Note: the same fine might be for more than one article violation.", 
        caption = "Data from https://www.privacyaffairs.com/gdpr-fines/ via #TidyTuesday challenge" ) + 
  theme_bw() + 
  theme(text = element_text(size = 14), 
        plot.title = element_text(hjust = 0.35), 
        plot.subtitle = element_text(hjust = 0.4))


