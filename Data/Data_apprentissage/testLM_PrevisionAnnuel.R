data <- read.csv(file="Alphaprise_previsionAnnuel.csv",head= TRUE,sep = ",")

library(caTools)

split <- sample.split(data,SplitRatio = 0.8)

apprentissage <- subset(data,split==TRUE)

test <- subset(data,split==FALSE)

modele <- lm(PrevisionnelAnnuel~. , data=apprentissage)

summary(modele)

res <- predict(modele,test, se.fit=TRUE, interval = "prediction", level = 0.99)

res


