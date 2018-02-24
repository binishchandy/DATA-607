processFile = function(filepath) {
        con = file(filepath, "r")
        while ( TRUE ) {
                line = readLines(con, n = 1)
                if ( length(line) == 0 ) {
                        break
                }
                print(line)
        }
        
        close(con)
}
#processFile("~/Documents/CUNY_SPS/DATA-607/project-01/tournamentinfo.txt")
processFile("~/Documents/CUNY_SPS/DATA-607/project-01/tour.txt")

require(stringr)
line_1 <- "1 | GARY HUA                        |6.0  |W  39|W  21|W  18|W  14|W   7|D  12|D   4|"
line_split <- unlist(str_split(line_1, "\\|"))
line_split_trimmed <- unlist(str_trim(line_split))

line_2 <- "19 | DIPANKAR ROY                    |4.0  |D  15|W  10|W  52|D  28|W  18|L   4|L   8|"
line_split_2 <- unlist(str_split(line_2, "\\|"))
line_split_trimmed_2 <- unlist(str_trim(line_split_2))

line_3 <- "ON | 15445895 / R: 1794   ->1817     |N:2  |W    |B    |W    |B    |W    |B    |W    |"
line_4 <- "Pair | Player Name                     |Total|Round|Round|Round|Round|Round|Round|Round|"
line_5 <- "Num  | USCF ID / Rtg (Pre->Post)       | Pts |  1  |  2  |  3  |  4  |  5  |  6  |  7  |"
line_6 <- "-----------------------------------------------------------------------------------------"
line_7 <- "  59 | SEAN M MC CORMICK               |2.0  |L  41|B    |L   9|L  40|L  43|W  54|L  44|"

players_list <- data.frame()
is_player_row_found <- FALSE
player <- vector('character')
#lines <- c(line_6, line_4, line_5, line_6, line_1, line_3, line_6, line_1, line_3, line_6)
lines <- c(line_7)
options(stringsAsFactors=FALSE)
for (i in 1:length(lines)) {
   #print(line_split[i])
   if (str_detect(lines[i], "^[[:space:]]*[[:digit:]]{1,2}")) {
           print(line[i])
           line_split <- unlist(str_split(lines[i], "\\|"))
           line_split_trimmed <- unlist(str_trim(line_split))
           pair_number_extract <- str_extract(line_split_trimmed, "^[[:digit:]]{1,2}$")
           pair_number <- pair_number_extract[!is.na(pair_number_extract)]
           #player_name_extract <- str_extract(line_split_trimmed, "^[[:upper:]]+[[:space:]][[:upper:]]+$")
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
           print(pair_number)
           print(player_name)
           print(total_points)
           print(opponents_as_csv)
           #players_list <- rbind(players_list, c(pair_number, player_name, total_points, opponents_as_csv))
           if (!is_player_row_found) {
                   player <- c(pair_number, player_name, total_points, opponents_as_csv)
                   is_player_row_found <- TRUE
           }
           
   } else if (str_detect(lines[i], "->[[:digit:]]+")){
           line_split <- unlist(str_split(lines[i], "\\|"))
           line_split_trimmed <- unlist(str_trim(line_split))
           player_state_extract <- str_extract(line_split_trimmed, "[[:upper:]]{2}")
           player_state <- player_state_extract[!is.na(player_state_extract)]
           pre_rating_extract <- str_extract(line_split_trimmed, "R:[[:space:]]+[[:digit:]]+")
           pre_rating_str <- pre_rating_extract[!is.na(pre_rating_extract)]
           pre_rating <- str_extract(pre_rating_str, "[[:digit:]]+")
           print(player_state)
           print(pre_rating)
           if (is_player_row_found) {
                   players_list <- rbind(players_list, c(player, player_state, pre_rating))
                   is_player_row_found <- FALSE
                   player <- vector('character')
           }
   }
}

name_1 <- "GARY HUA"
name_2 <- "PATRICK H SCHILLING"
name_3 <- "CAMERON WILLIAM MC LEMAN"
name_4 <- "SOFIA ADINA STANESCU-BELLU"
line <- "59 | SEAN M MC CORMICK               |2.0  |L  41|B    |L   9|L  40|L  43|W  54|L  44|"

str_extract("SEAN M MC CORMICK", "^[[:upper:]]+[[:space:]]+[[:upper:]]*[[:space:]]*[[:upper:]]*[[:space:]]*[[:upper:]]+$|^[[:upper:]]+[[:space:]]+[[:upper:]]*[[:space:]]*[[:upper:]]*-[[:upper:]]+$")
str_extract("SEAN M MC CORMICK", "^[[:upper:]]+[[:space:]]+[[:upper:]]*[[:space:]]*[[:upper:]]*[[:space:]]*[[:upper:]]+$")
str_extract(line, "SEAN M MC CORMICK")
