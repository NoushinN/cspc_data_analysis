# source data import and tidy script
if (!exists(".setup_sourced")) source(here::here("data_import_tidy.R"))

# wrangle data (sheet 7)
# graph 1
sheet_7 %>%
  filter(! career_stage == "0.0") %>%
  group_by(attendance, career_stage) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = career_stage, y = count, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Career stage", title = "Career Stage/attendance type of Participants",
                    subtitle = "1.0 = student/trainee; 2.0 = early career < 5; 3.0 = mid career 5+") +
  scale_fill_manual(values=c("seagreen4", "blue4", "orange"))
  
 
# graph 2
sheet_7 %>%
  filter(! career_stage == "0.0") %>%
  group_by(attendance, career_stage) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = attendance, y = count, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Attendance", title = "Attendance types",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "orange")) 


# graph 3
sheet_7 %>%
  filter(! overall == "NA") %>%
  group_by(overall) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = overall, y = count, fill = overall)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Overall ratings", title = "Overall experience at CSPC",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 
  

# graph 4
sheet_7 %>%
  filter(! forum == "NA") %>%
  group_by(forum) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = forum, y = count, fill = forum)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Forum ratings", title = "Did CSPC act as a forum for the exploration of issues in science, technology, and innovation policy",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 5
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(connections) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = connections, y = count, fill = connections)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Connections ratings", title = "Did CSPC strengthen connections between science stakeholders and sectors of society",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 
