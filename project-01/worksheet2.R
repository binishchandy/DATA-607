require(stringr)
processFile = function(filepath) {
        con = file(filepath, "r")
        
        players_list <- data.frame()
        is_player_row_found <- FALSE
        player <- vector('character')
        options(stringsAsFactors=FALSE)
        
        while ( TRUE ) {
                line = readLines(con, n = 1)
                if ( length(line) == 0 ) {
                        break
                }
                
                if (str_detect(line, "^[[:space:]]*[[:digit:]]{1,2}")) {
                        line_split <- unlist(str_split(line, "\\|"))
                        line_split_trimmed <- unlist(str_trim(line_split))
                        pair_number_extract <- str_extract(line_split_trimmed, "^[[:digit:]]{1,2}$")
                        pair_number <- pair_number_extract[!is.na(pair_number_extract)]
                        player_name_extract <- str_extract(line_split_trimmed,
                          "^[[:upper:]]+[[:space:]]+[[:upper:]]*[[:space:]]*[[:upper:]]*[[:space:]]*[[:upper:]]+$|^[[:upper:]]+[[:space:]]+[[:upper:]]*[[:space:]]*[[:upper:]]*-[[:upper:]]+$")
                        player_name <- player_name_extract[!is.na(player_name_extract)]
                        total_points_extract <- str_extract(line_split_trimmed, "^[[:digit:]].[[:digit:]]$")
                        total_points <- total_points_extract[!is.na(total_points_extract)]
                        result_with_player_extract <- str_extract(line_split_trimmed, "^[[:upper:]][[:space:]]+[[:digit:]]+$")
                        result_with_player <- result_with_player_extract[!is.na(result_with_player_extract)]
                        opponents <- str_extract(result_with_player, "[[:digit:]]+")
                        opponents_as_csv <- str_c(opponents, collapse=",")
                        #player <- c(pair_number, player_name, total_points, opponents_as_csv)
                        #print(pair_number)
                        #print(player_name)
                        #print(total_points)
                        #print(opponents_as_csv)
                        #players_list <- rbind(players_list, c(pair_number, player_name, total_points, opponents_as_csv))
                        #print(players_list)
                        #if (!is_player_row_found) {
                                player <- c(pair_number, player_name, total_points, opponents_as_csv)
                                #print(player)
                                #is_player_row_found <- TRUE
                        #}
                        #print(players_list)

                 }
                else if (str_detect(line, "->[[:space:]]*[[:digit:]]+")){
                        line_split <- unlist(str_split(line, "\\|"))
                        line_split_trimmed <- unlist(str_trim(line_split))
                        player_state_extract <- str_extract(line_split_trimmed, "[[:upper:]]{2}")
                        player_state <- player_state_extract[!is.na(player_state_extract)]
                        pre_rating_extract <- str_extract(line_split_trimmed, "R:[[:space:]]+[[:digit:]]+")
                        pre_rating_str <- pre_rating_extract[!is.na(pre_rating_extract)]
                        pre_rating <- str_extract(pre_rating_str, "[[:digit:]]+")
                        #print(player_state)
                        #print(pre_rating)
                        #print(players_list)
                        #if (is_player_row_found) {
                                players_list <- rbind(players_list, c(player, player_state, pre_rating, 0))
                                #print(c(player_state, pre_rating))
                                #is_player_row_found <- FALSE
                                #player <- vector('character')
                        #}
                        #print(players_list)
                }
                
        }
        
        close(con)
        colnames(players_list) <- c("pair_num", "name", "total_pts", "opponents_as_csv", "state", "pre_rating", "avg_opponents_rating")
        return(players_list)
}
df <- processFile("~/Documents/CUNY/DATA-607/project-01/tournamentinfo.txt")
df$pre_rating <- as.numeric(as.character(df$pre_rating))
#processFile("~/Documents/CUNY/DATA-607/project-01/tour.txt")

for (i in 1:nrow(df)) {
  #print(df_short[i, ])
  opponents <- unlist(str_split(df[i, ]$opponents_as_csv, ","))
  #print(opponents)
  sum = 0
  for (j in 1:length(opponents)) {
    #print(df_short[j, ]$pre_rating)
    pre_rating <- df[opponents[j], ]$pre_rating
    #print(pre_rating)
    sum = sum + pre_rating
  }
  #print(sum)
  #print(length(opponents))
  #print(sum / length(opponents))
  df[i, "avg_opponents_rating"] <- (floor(sum / length(opponents)))
}

new_df <- data.frame("name" = df$name,
                     "state" = df$state,
                     "total_pts" = df$total_pts,
                     "pre_rating" = df$pre_rating,
                     "avg_opponents_rating" = df$avg_opponents_rating)
new_df$avg_opponents_rating <- as.numeric(as.character(new_df$avg_opponents_rating))

write.csv(new_df, "players.csv", row.names=FALSE)

