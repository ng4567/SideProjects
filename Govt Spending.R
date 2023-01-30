library(ggplot2)
library(treemapify)
library(reshape2)
library(ggsci)
library(viridis)
library(tidyverse)

#source: https://datalab.usaspending.gov/americas-finance-guide/spending/categories/

Categories <- c('Income Security', 'Social Security', 'Health', 'Defense', 'Medicare', 'Interest on Debt',
                'Housing', 'Education/Social Services', 'General', 'Veterans', 'Misc')

percentages <- c(0.24, 0.17, 0.12, 0.11, 0.1, 0.05, 0.04, 0.04, 0.04, 0.03, 0.06)

labels <- c('Income Security \n(24%)', 'Social Security \n(17%)', 'Health \n(12%)', 
            'Defense \n(11%)', 'Medicare \n(10%)', 'Debt Interest \n(5%)', 'Housing \n(4%)', 
            'Education \n(4%)','General \n(4%)', 'Veterans \n(3%)', 'Misc \n(6%)')

Subcategories <- c("Welfare/Entitlements (41%)","Welfare/Entitlements (41%)", "Healthcare (22%)", 
             "Defense (11%)", "Healthcare (22%)", 
             "Other (26%)", "Other (26%)", "Other (26%)", "Other (26%)", 
             "Other (26%)", "Other (26%)")


df <- data.frame(Categories, percentages, labels, Subcategories)

df$Subcategories <- as.factor(df$Subcategories)

df %>% group_by(Subcategories) %>%
  summarise(sum(percentages))

#create treemap (1st style) <- final plot
ggplot(df, aes(area = percentages, fill = Subcategories,
               label = labels, subgroup = Subcategories)) +
  geom_treemap() + 
  geom_treemap_text(place = "center") +
  geom_treemap_subgroup_border(colour = "black", size = 2) +
  ggtitle("US Federal Government Spending by Category") + 
  labs(caption = "Source: US Treasury Dept") 


#separated blocks style
ggplot(df, aes(area = percentages, fill = Subcategories,
             label = labels, subgroup = Subcategories)) +
geom_treemap() +
geom_treemap_subgroup_border(colour = "white", size = 5) +
geom_treemap_text(colour = "white", place = "centre", size = 15, grow = TRUE) +
ggtitle("US Federal Government Spending by Category") + 
labs(caption = "Source: US Treasury Dept")


#healthcare spending by country




#att data analysis

#represents monthly data usage in gigabytes
data_usage <- c(3,12,13,23,23,14,26,15,15,15,12,16,16,19,17,16)


hotspot <- c(1,1,6,2,5)










