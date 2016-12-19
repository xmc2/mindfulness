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