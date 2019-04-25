getwd()
setwd("C:/Users/studentas/Desktop/3_seminaras")
dir()
best <- function(state,outcome){
  df <- read.csv("outcome-of-care-measures.csv",
                 stringsAsFactors = FALSE,
                 na.strings="Not Available")
  if(!state %in% unique(df$State)){stop("Invalide state")}
  if(!outcome %in% c("heart attack","heat failure","pseumonia"))
     {stop("Invalide outcome")}
}
if(outcome=="heart attack") {
  df <- df[,c(2,7,11)]}
  else if(outcome=="heart failure") {
df <- df[,c(2,7,17)]  else{
  df <- df[,c(2,7,23)]
}
df <- df[!is.na(df[,3]),]
df <- df[df[,2]==state,]
df <- df[order(df[,3], df[,1])]
df(1,1)