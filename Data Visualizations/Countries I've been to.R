library(ggplot2)
library(dplyr)

thismap = map_data("world")

countries <- c("USA", "Mexico", "Hong Kong", "UK", "Spain", "Netherlands", "France", 
               "Italy", "Greece", "Turkey", "Germany", "Switzerland", "Lithuania", "India", 
               "Thailand", "South Korea", "Nepal", "Belgium", "Vatican")

regions <- c("Puerto Rico")

transit <- c("Romania", "China", "Canada", "Qatar")

thismap$color <- NA

# Set colors
#thismap <- mutate(thismap, fill = ifelse(region %in% countries, "red", "white"))

for(i in 1:99338){
  if(thismap$region[i] %in% countries){
    thismap$color[i] <- 1
  }else if(thismap$region[i] %in% regions){
    thismap$color[i] <- 1
  }else if(thismap$region[i] %in% transit){
    thismap$color[i] <- 2
    }else{
  thismap$color[i] <- 3
  }
}


# Use scale_fiil_identity to set correct colors
ggplot(thismap, aes(long, lat, fill = color, group=group)) + 
  geom_polygon(colour="gray") + ggtitle("Map of Countries I've Been") + 
  scale_fill_identity() 

