# Libraries
library(ggplot2)
library(dplyr)
library(tidyverse)

dates <- c("2022-09-01", "2022-10-01", "2022-11-01", "2022-12-01", "2023-01-01")
hours <- c(80, 100, 280, 800, 1400)
sessions <- c(300, 400, 1100, 3200, 5500)

df <- data.frame(dates, hours, sessions)

df$dates <- as.Date(df$dates)


#growth rate calculation

df <- df %>%
  mutate(
    growth_rate = ((sessions - lag(sessions))/lag(sessions)) * 100
  )

df$growth_rate <- format(round(df$growth_rate, 2), nsmall = 2)

# Most basic bubble plot
hours <- ggplot(df, aes(x=dates, y=hours)) +
  geom_line() + 
  xlab("Date") + 
  ylab("Hours") +
  ggtitle("Hours Spent by Month") +
  geom_line( color="blue")


sessions <- ggplot(df, aes(x=dates, y=sessions)) +
  geom_line() + 
  xlab("Date") + 
  ylab("Sessions") +
  ggtitle("Sessions Per Month") +
  geom_line( color="blue") +
  geom_label(aes(label = growth_rate))

active_users <- ggplot(df, aes(x=dates, y=sessions)) +
  geom_line(color="blue") + 
  xlab("Date") + 
  ylab("Active Users") +
  ggtitle("Active Users Per Month") +
  geom_label(aes(label = growth_rate)) 


hours
sessions
active_users
