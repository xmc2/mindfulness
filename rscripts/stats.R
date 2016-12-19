# preprocessing 

bplot <- dat %>%
  group_by(User_id) %>%
  group_by(File) %>%
  dplyr::select(File) %>%
  table() 

