# Preprocessing 

# **********
# Original using dat directly
# **********
# bplot <- dat %>%
#  group_by(User_id) %>%
#  group_by(File) %>%
#  dplyr::select(File) %>%
#  table() 

# **********
# Updated
# **********

# Total Number 'Plays' for each audio files
filt <- filter(dat, Action == "play")
bplot <- filt %>%
  group_by(User_id) %>%
  group_by(File) %>%
  dplyr::select(File) %>%
  table() 

# Total Number 'Clicks' (both plays and pauses) for each audio files
bplot2 <- dat %>%
  group_by(User_id) %>%
  group_by(File) %>%
  dplyr::select(File) %>%
  table() 

# Total Number Audio Files Accessed by *** Date ***
filt <- filter(dat, Action == "play")
bplot3 <- filt %>%
  group_by(Date, File) %>%
  dplyr::select(File, Date) %>%
  table() 

# Total Number Clicks by *** Date
bplot4 <- dat %>%
  group_by(Date, File) %>%
  dplyr::select(File, Date) %>%
  table() 
          
          