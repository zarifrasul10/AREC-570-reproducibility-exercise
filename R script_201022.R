rm(list=ls())
options(scipen = 100)   ## Turning scientific notation off so that the final regression output does not contain scientific notation



# reading in datasets 

GDP_data <- read.csv("inputs/gdp_52-67.csv")            
LE_data <- read.csv("inputs/le_52-67.csv")


 #merging datasets
total <- merge(GDP_data,LE_data,by=c("continent","country","year"))


#calculating GDP per capita
gdpPercap = total$gdp/total$pop

#putting gdpPercap in the table with the rest of the data
total$gdpPercap <- gdpPercap

#plotting 
plot(subset(total, country =="Canada",
            select=c(year,lifeExp)), type = "l", main = "Life expectancy in Canada" )


plot(subset(total, country =="Canada",
            select=c(year,gdpPercap)), type = "l", main = "Per Capita GDP in Canada" )

#regressing life expectancy on per capita GDP

reg = lm(formula = total$lifeExp~total$gdpPercap)
summary(reg)

