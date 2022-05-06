####   Response Time Analysis ####
       ## Todd Poole 5/6/2022  City of South Burlington Vermont Fire Dept Response Times by Station analysis 2016-2021 ##

 -      #load packages#

        library("tidyverse")
        library("rmarkdown")

####   Import data and remove non-essential fields/variables ####

                Pivot_Table_2016_2021.df <- read.csv(file = "pivot20162021.csv",header = TRUE, na.strings=c("", "NA"),sep = ",")
        
####   Build new data frame and filter for 465 Quarryhill, Allen road, 1510-1530 Williston, 20 Harborview ####
        
                Response_Times.df <- Pivot_Table_2016_2021.df %>%
                        select(inci_id,station,number,street,resp) %>%
                        filter(number %in% c("90","20","1510","465","310","1530"),street %in% c("Williston","Quarryhill", "Allen", "Anderson","Harborview","Market"))
                
        ## Now build discrete data frames for each occupancy and explore by apparatus and build box plot graphs ##
                
                ## 1510 and 1530 Williston Rd., Ladder1 responses (Gazebo_ladder1.df) ##
                
                Gazebo_ladder1.df <- Response_Times.df %>% 
                       filter(number %in% c("1510","1530"), street %in% c("Williston")))
                summary(Gazebo_ladder1.df$resp)
                
                ## 1510 and 1530 Williston Rd., Engine2 responses (Gazebo_engine2.df) ##
                
                Gazebo_engine2.df <- Response_Times.df %>% 
                        filter(number %in% c("1510","1530"), street %in% c("Williston"),
                summary(Gazebo_station2.df$resp)
                
                ## 90 Allen, Engine 2 responses (Allen_engine2.df) ##
                
                Allen_engine2.df <- Response_Times.df %>% 
                        filter(number %in% c("1510","1530"), street %in% c("Williston"))
                summary(Allen_engine2.df$resp)
                