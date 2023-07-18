library(stats)
library(dplyr)
library(corrplot)
library(cluster)
library(psych)
library(dlookr)
library(SmartEDA)
library(DataExplorer)
library(tidyverse)
library(ggfortify)

######
library(MASS)
##Multicollinearity
library(regclass)
library(ridge)

#### Heteroscedasticity
library("lmtest")

#### Autocorrelation
#install.packages("orcutt")
library("orcutt")

####Outliers
library(olsrr)
library(robustbase)
getwd()

setwd("C:/Users/shris/Desktop")
df=read.csv("Concrete_Data.csv")
head(df)

ncol(df)
nrow(df)
#total dimension 9 X 1030

##changing name of columns
names(df) <- c("Cement","BlastFurnace","Fly_Ash","Water","Superplasticizer","Coarse_Aggregate","Fine_Aggregate","Age","Concrete_strength")
head(df)
data=df
head(data)

#EDA
create_report(data)

## Regression

model1 = lm(Concrete_strength~ Cement, data = data)
model1
summary(model1)

model2 = lm(Concrete_strength~BlastFurnace , data = data)
model2
summary(model2)

model3 = lm(Concrete_strength~Fly_Ash, data = data)
model3
summary(model3)

model4 = lm(Concrete_strength~Water , data = data)
model4
summary(model4)

model5 = lm(Concrete_strength~Superplasticizer , data = data)
model5
summary(model5)

model6 = lm(Concrete_strength~
              Coarse_Aggregate , data = data)
model6
summary(model6)


model7 = lm(Concrete_strength~Fine_Aggregate , data = data)
model7
summary(model7)


model8 = lm(Concrete_strength~Age , data = data)
model8
summary(model8)

#Final model


model = lm(Concrete_strength~.,data=data)
model
summary(model) ##Model with all the attributes is having highest adjusted R square value

# model plot 

par(mfrow = c(2,2))
plot(model)

## backward stepwise regression

step(model,direction="backward",trace=1)



## mean of errors ##
mean(model$residuals) ## 5.321269e-16 almost zero

##Normality of residuals

#histogram plots of residual
hist(model$residuals)
qqnorm(model$residuals)
qqline(model$residuals,col=2)# non normal
shapiro.test(model$residuals)


##transformation

#log tranns

y= log(data$Concrete_strength)
fit2<-lm(y~.,data=data)
shapiro.test(fit2$residuals) 

#(BOXCOX transformation)
y=data$Concrete_strength
bc <- boxcox(data$Concrete_strength ~ 1)
lambda <- bc$x[which.max(bc$y)]
lambda


y1<-((y^lambda-1)/lambda)


fit1<- lm(y1~.,data=data)
shapiro.test(fit1$residuals)

hist(fit1$residuals)





##heteroscadicity


dev.off()
#par(mfrow=c(1,2))

plot(y = model$residuals, x = model$fitted.values,xlab = "fitted values",  ylab = "residuals", col=2,pch=16)
abline(0,0,col="blue",lwd=2)



gqtest(Concrete_strength~.,data=data)  ##   p-value = 1 not hetero




##Multicollineraity

V = VIF(model)
V
barplot(V, main = "VIF Values", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)

#REMEDIES
#Removing Fine Aggregate

fit_remove<-lm(Concrete_strength~.,data[,-7])
summary(fit_remove) # 6.115= Adj-R2
VIF(fit_remove)



##Autocorrelation


dev.off()
lmtest::dwtest(model) # p-value=2.2 *10(-16)
acf(residuals(model))
# remedy 1 - cochrane 

coch<- cochrane.orcutt(model)
coch
coch.predict<- predict(coch)
summary(coch)

residuals(coch)
dev.off()

lmtest::dwtest(coch)



##Outliers


cooksD<-cooks.distance(model)

max(cooksD)

ols_plot_cooksd_chart(model)

dev.off()


influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]
influential


names_of_influential <- names(influential)
names_of_influential
outliers <- data[names_of_influential,]
outliers
hitters_without_outliers <- data %>% anti_join(outliers)

data_WO = hitters_without_outliers

## fit model without outliers

fit_WO<-lm(Concrete_strength~., data=data_WO)
summary(fit_WO)

stepAIC(fit_WO,direction="backward",trace=1)













