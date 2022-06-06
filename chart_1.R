library(dplyr)
library(cluster)
library(ggplot2)
library(readr)
library(datasets)
library(corrplot)
library(stats)
library(ggrepel)
library(textir) 
library(BBmisc)
library(rstudioapi)
library(factoextra)

get_pca <- function(inputs) {
    # -------------- Data  Import --------------------
    advanced_data <- read.csv("data/nba_2021_22_advanced_stats.csv")
    
    advanced_data$Player <- sub("\\\\.*", "", advanced_data$Player)
    main_df <- advanced_data
        #merge(data1, advanced_data, by="Player", all.y=FALSE, all.x=FALSE)
    
    # ------------- Data Cleaning --------------------
    
    main_df$MPG <- main_df$MP/main_df$G;
    main_df$A2TO <- main_df$AST/main_df$TOV
    
    main_df[is.na(main_df)] <- 0 
    
    # --------------- Team Selection -------------------------
    
    team1 <- inputs
    team2 <- "MEM"
    
    main_df <- main_df %>%
        filter(Tm == team1) 
    
    feature_df <- main_df[c(9:29)]
    feature_df <- normalize(feature_df, method="standardize")
    
    # --------------- Unsupervised Learning -----------------
    res_cov <- cov(feature_df);
    
    round(res_cov, 2);
    
    eig <- eigen(res_cov)$vectors;
    
    eigenv2 <- eig[,(1:2)];
    
    stats_matrix <- data.matrix(feature_df, rownames.force = NA);
    
    PrincipalComponents2 <- stats_matrix%*%eigenv2;
    
    stats_df <- data.frame(PrincipalComponents2); 
    
    # PCA Plot
    result <- ggplot(stats_df,aes(stats_df$X1, stats_df$X2)) +
        labs(x="PC1",y="PC2")+
        geom_point(data=main_df, aes(col=Pos, size=VORP))+
        geom_text_repel(data=main_df, aes(label=Player), size=3+main_df$VORP/max(main_df$VORP)) 
    
    return(result)
} 
    