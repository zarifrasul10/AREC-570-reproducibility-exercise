rm(list=ls())
options(scipen = 100)




GDP_data <- read.csv("inputs/gdp_52-67.csv")
LE_data <- read.csv("inputs/le_52-67.csv")


total <- merge(GDP_data,LE_data,by=c("continent","country","year"))



gdpPercap = total$gdp/total$pop


total$gdpPercap <- gdpPercap


plot(subset(total, country =="Canada",
            select=c(year,lifeExp)), type = "l", main = "Life expectancy in Canada" )


plot(subset(total, country =="Canada",
            select=c(year,gdpPercap)), type = "l", main = "Per Capita GDP in Canada" )



reg = lm(formula = total$lifeExp~total$gdpPercap)
summary(reg)

