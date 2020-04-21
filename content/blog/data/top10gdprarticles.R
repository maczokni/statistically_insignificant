library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

gdpr_violations <- read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-21/gdpr_violations.tsv')
gdpr_text <-read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-21/gdpr_text.tsv')

articles <- paste(gdpr_violations$article_violated, collapse = "|")

articles_df <- data.frame(articles = as.list(strsplit(articles, "\\|")[[1]]))

articles_df <- articles_df %>% 
  mutate(n = c(1:nrow(.))) %>%  
  pivot_longer(-n) %>% 
  select(value) %>% 
  mutate(value = trimws(value, which = "both"))

articles_df %>% 
  group_by(value) %>% 
  count() %>% 
  arrange(-n) %>% 
  head(n = 10) %>% 
  ggplot(., aes(x = reorder(value, n), y = n)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  xlab("") + 
  ylab("Number of violations") + 
  labs(title = "Number of violations of the top 10 most violated articles of GDPR",
        subtitle = "Note: the same fine might be for more than one article violation.") + 
  theme_bw() + 
  theme(text = element_text(size = 14), 
        plot.title = element_text(hjust = 0.35), 
        plot.subtitle = element_text(hjust = 0.4))


