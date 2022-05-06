####   Response Time Analysis ####
       ## Todd Poole 5/6/2022  City of South Burlington Vermont ##

        library("tidyverse")


        
####   Import data and remove non-essential fields/variables ####

        Pivot_Table_2016_2021.df <- read.csv(file = "pivot20162021.csv",header = TRUE, na.strings=c("", "NA"),sep = ",")
        
        
####   Build new data frame with only columns and rows needed ####
        
        Response_Times.df <- Pivot_Table_2016_2021.df %>%
                select(inci_id,station,number,street,resp) %>%
                filter()
                