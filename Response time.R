####   Response Time Analysis ####
       ## Todd Poole 5/6/2022  City of South Burlington Vermont Fire Dept Response Times by Station analysis 2016-2021 ##

 -      #load packages#

        library("tidyverse")
       
####   Import data and remove non-essential fields/variables ####

                Pivot_Table_2016_2021.df <- read.csv(file = "pivot20162021.csv",header = TRUE, na.strings=c("", "NA"),sep = ",")
                Unitresp20102021.df <- read.csv(file = "unitresp20102021.csv",header = TRUE, na.strings=c("", "NA"),sep = ",")
        
                ## Left join both df above ##
                
                        Left_joinedpivotresp.df <- left_join(Pivot_Table_2016_2021.df,Unitresp20102021.df, by = "inci_no")
                        
####   Build new data frame and filter for 465 Quarry Hill, 90 Allen road, 1510-1530 Williston, 20 Harborview ####
        
                Frequent_healthcare.df <- Left_joinedpivotresp.df %>%
                        select(inci_no,station,number,street,resp,unit_desc) %>%
                        filter(number %in% c("90","20","1510","465","310","1530"),street %in% c("Williston","Quarry Hill","Quarry Hill Road", "Allen", "Anderson","Harborview","Market"))
                
        ## Now build discrete data frames for each occupancy and explore by apparatus and build box plot graphs ##
                
                ## 1510 and 1530 Williston Rd., Ladder1 responses (Gazebo_ladder1.df) ##
                
                Gazebo_ladder1.df <- Frequent_healthcare.df %>% 
                       filter(number %in% c("1510","1530"), street %in% c("Williston"), unit_desc %in% c("Ladder 1"))
                        summary(Gazebo_ladder1.df$resp)
                        
                       
                                
                        hist(Gazebo_ladder1.df$resp, breaks = 10, main = "Ladder 1 respones to 1510 / 1530 Williston rd",xlab = "Seconds")
                                abline(v=c(mean(Gazebo_ladder1.df$resp),median(Gazebo_ladder1.df$resp)),lty=c(2,3),lwd=2)
                                abline(v=300,lty=4,col = "red",lwd=2)
                                legend("topright",legend = c("mean","median","NFPA 1710"),col = c("black","black","red"),lty=c(2,3,4),lwd = 2)
                       
                        boxplot(Gazebo_ladder1.df$resp,main="Ladder 1 response to 1510 or 1530 Williston rd.",xlab = "", ylab = "Seconds")
                                abline(h=c(300),col="red",lty=4, lwd=2)
                        
                        Gazebo_ladder1.df %>%
                                ggplot(aes(resp)) +
                                geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.7, bw=30) +
                                ggtitle("Ladder 1 Response to 1510/1530 Williston rd.") +
                                geom_vline(xintercept = 300, linetype="dashed", color = "red", size=1) +
                                xlab("Seconds") +
                                ylab("")
                                
                                
                                
                        
                ## 1510 and 1530 Williston Rd., Engine2 responses (Gazebo_engine2.df) ##
                
                Gazebo_engine2.df <- Frequent_healthcare.df %>% 
                        filter(number %in% c("1510","1530"), street %in% c("Williston"), unit_desc %in% c("Engine 2"))
                        summary(Gazebo_engine2.df$resp)
                
                ## 90 Allen, Engine 2 responses (Allen_engine2.df) ##
                
                Allen_engine2.df <- Frequent_healthcare.df %>% 
                        filter(number %in% c("90"), street %in% c("Allen"), unit_desc %in% c("Engine 2"))
                        summary(Allen_engine2.df$resp)
                