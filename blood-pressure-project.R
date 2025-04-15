library(dplyr)
library(tidyverse)
library(rstatix)
library(ggpubr)
library(reshape2)

rawdata <- read.csv(file.choose(), header=T, stringsAsFactors = T)

View(rawdata)

rawdata_long <- rawdata %>% gather(key= "Visit", value= "Score", SBP_V1, SBP_V2, SBP_V3) %>%
  convert_as_factor(Seial.no., Visit)

View(rawdata_long)

rawdata_long %>% group_by(Visit) %>% shapiro_test(Score)
rawdata_long %>% group_by(Visit) %>% identify_outliers(Score)
## not normally distributed

summary <- rawdata_long %>% group_by(Visit) %>% get_summary_stats(Score, type= "full") #full describtives
View(summary)
#export descriptive table 
write.csv(summary, "Descriptive_Statistics.csv", row.names = FALSE)

## non parametric friedman
rawdata_fried <-  friedman_test(rawdata_long, Score~Visit |Seial.no.)
rawdata_fried

##Post hoc
rawdata_pair <- pairwise_wilcox_test(rawdata_long, Score ~ Visit, paired = TRUE, p.adjust.method = "bonferroni")
View(rawdata_pair)

## Visuals
# basic graph
fried_visual <- ggboxplot(rawdata_long, x= "Visit", y= "Score", fill= "Visit",
                          bxp.errorbar = T, bxp.errorbar.width = 0.2)
fried_visual

# adding p value
pair_visual <- rawdata_pair  %>% add_xy_position(x= "Visit", 
                                                 step.increase = 0.3) #push the p-values higher
fried_visual + stat_pvalue_manual(pair_visual) + 
  labs(subtitle = get_test_label(rawdata_fried))+ theme_bw()

