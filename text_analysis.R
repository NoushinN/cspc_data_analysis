# source data import and tidy script
if (!exists(".setup_sourced")) source(here::here("data_import_tidy.R"))


# load text analysis package
library(tidytext)

# load data with text
cspc_raw_1 <- read_excel(here("raw_data", "cspc_raw_2019.xlsx"), 
                         sheet = 1, col_names = FALSE,
                         .name_repair = "unique")

# tidy table for text analysis
cspc_text <- cspc_raw_1 %>%
  select(...94) %>%
  filter(!...94 == "NA") %>%
  rename("open_ended" =...94)

# tokenize text
cspc_text %>%
  unnest_tokens(word, open_ended) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(n > 3) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip() +
  theme_bw() +
  ylab("number of times words were repeated") +
  ggtitle("Word frequency in open-ended responses")


# sentiment analysis
cspc_text %>%
  unnest_tokens(word, open_ended) %>%
  anti_join(stop_words) %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  group_by(sentiment) %>%
  top_n(10) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment",
       x = NULL) +
  coord_flip() +
  theme_bw()


# generate wordcloud
library(wordcloud)

cspc_text %>%
  unnest_tokens(word, open_ended) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 200))
