# source data import and tidy script
if (!exists(".setup_sourced")) source(here::here("data_import_tidy.R"))

# wrangle data (sheet 7)
# graph 1
sheet_7 %>%
  filter(! career_stage == "0.0") %>%
  group_by(attendance, career_stage) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = career_stage, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Career stage", y = "percentage", title = "Career Stage/attendance type of Participants",
                    subtitle = "1.0 = student/trainee; 2.0 = early career < 5; 3.0 = mid career 5+") +
  scale_fill_manual(values=c("seagreen4", "blue4", "orange"))
  
 
# graph 2
sheet_7 %>%
  filter(! career_stage == "0.0") %>%
  group_by(attendance, career_stage) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = career_stage, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Attendance", y = "percentage", title = "Attendance types",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "orange")) 


# graph 3
sheet_7 %>%
  filter(! attendance == "NA") %>%
  group_by(attendance, overall) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = overall, y = count, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Overall ratings", y = "percentage", title = "Overall experience  by attendance at CSPC",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 
  

# graph 4
sheet_7 %>%
  filter(! attendance == "NA") %>%
  group_by(attendance, forum) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = forum, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Forum ratings", y = "percentage", title = "Did CSPC act as a forum",
                    subtitle = "for the exploration of issues in science, technology, and innovation policy") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 5
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, connections) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = connections, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Connections ratings", y = "percentage", title = "Did CSPC strengthen connections ",
                    subtitle = "between science stakeholders and sectors of society") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 6
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, capacity) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = capacity, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Capacity ratings", y = "percentage", title = "Did CSPC build capacity",
                    subtitle = "for the next generation of science policy experts") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 

# graph 7
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, engagement) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = engagement, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Engagement ratings", y = "percentage", title = "Did CSPC promote",
                    subtitle = "and /or engaged in research and analysis in science policy") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 8
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, welcomed) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count) * 100) %>%
  ggplot(aes(x = welcomed, y = freq, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Welcome ratings", y = "percentage", title = "Did CSPC make you feel welcomed?",
                    subtitle = "") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 9
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, edi) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = edi, y = count, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "EDI ratings", title = "Did CSPC reflect commitment to",
                    subtitle = "diversity, accessibility, inclusion, and equity?") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


# graph 10
sheet_7 %>%
  filter(! connections == "NA") %>%
  group_by(attendance, diversity) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = diversity, y = count, fill = attendance)) +
  geom_bar(stat = "identity") + 
  coord_flip() +
  theme_bw() + labs(x = "Diversity ratings", title = "Did CSPC include",
                    subtitle = "representation of diverse individual and organizational perspectives") +
  scale_fill_manual(values=c("seagreen4", "blue4", "darkorange3", "cyan4", "gold1")) 


