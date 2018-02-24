options(stringsAsFactors=FALSE)
df_short <- data.frame()

df_short <- rbind(df_short, c("1", "2,3", 1, 0))
df_short <- rbind(df_short, c("2", "1,3", 2, 0))
df_short <- rbind(df_short, c("3", "1,2", 3, 0))
colnames(df_short) <- c("pair_num", "opponents_as_csv", "pre_rating", "avg_opponent_rating")
df_short$pre_rating <- as.numeric(as.character(df_short$pre_rating))

for (i in 1:nrow(df_short)) {
  #print(df_short[i, ])
  opponents <- unlist(str_split(df_short[i, ]$opponents_as_csv, ","))
  #print(opponents)
  sum = 0
   for (j in 1:length(opponents)) {
     #print(df_short[j, ]$pre_rating)
     pre_rating <- df_short[opponents[j], ]$pre_rating
     #print(pre_rating)
     sum = sum + pre_rating
   }
  #print(sum)
  #print(length(opponents))
  #print(sum / length(opponents))
  df_short[i, "av_opponent_rating"] <- (sum / length(opponents))
}

