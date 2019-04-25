getwd()
setwd("C:/Users/studentas/Desktop/3seminaras")

data <- read.csv("data-table.csv",
                 sep=",",
                 header = TRUE,
                 encoding="UTF-8",
                 stringsAsFactor=FALSE)
install.packages("readr")
str(data)

#Apskaiciuokite vidutini nedarbo lygi laikotarpiui 1998-2018 pagal amziaus grupes. Jums pgali buti prasminga
#pries skaiciuojant, susikurti nauja R objekta, kuriame butu tik "Miestas ir kaimas", "Vyrai ir moterys".
#Apskaiciuojant nepasalinkite na.rm.

df <- data[data$Lytis=="Vyrai ir moterys" &
             data$Gyvenamoji.vietove=="Miestas ir kaimas",]
aggregate(df$Reiksme, list(df$Amzius..tikslines.amziaus.grupes.),mean )
#arba
tapply(data$Reiksme,INDEX=data$Amzius..tikslines.amziaus.grupes., FUN = mean)

#nubraizykite grafika

df <- data[data$Lytis=="Vyrai ir moterys" & data$Gyvenamoji.vietove=="Miestas ir kaimas" & data$Amzius..tikslines.amziaus.grupes. %in% c("15-24","15-74"),]
png("nedarbo_lygio_statistika.png", width=960)

plot(df[df[,3]=="15-24",1],
     df[df[,3]=="15-24",7],
type="l",
col="red",
ylim=c(0,40),
xlab="Metai",
ylab="Nedarbo lygis,%")
lines(df[df[,3]=="15-74",1],
df[df[,3]=="15-74",7],
type="l",
col="blue")
dev.off()
