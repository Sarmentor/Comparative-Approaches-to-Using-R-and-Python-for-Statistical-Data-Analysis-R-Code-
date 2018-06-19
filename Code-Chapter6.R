##Linear Regression - BEGIN##

# Data recoded
data$Gender<-ifelse(data$Gender=="female", 1, 0)
data$Python_user<-ifelse(data$Python_user=="yes", 1, 0)
data$R_user<-ifelse(data$R_user=="yes", 1, 0)

Publications.lm = lm(Publications ~ Gender + Python_user + R_user + Age, data=data.df)

summary(Publications.lm)

coeffs = coefficients(Publications.lm)

newdata = data.frame(Age=75)

predict(Publications.lm, newdata)

#predict with confidence interval 95%
predict(Publications.lm, newdata, interval="confidence")
##Linear Regression - END##