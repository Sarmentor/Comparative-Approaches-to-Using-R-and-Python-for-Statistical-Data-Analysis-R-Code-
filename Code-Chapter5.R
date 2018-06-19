##inference - BEGIN##

library(lattice)
library(zoo)
#Take NAs out
na.aggregate(data.df$Age)
na.aggregate(data.df$Publications)

#test normality with normal Q-Q Plot
qqmath(na.aggregate(data.df$Age), distribution = qnorm, type = c("p", "g"),
       aspect = "xy", pch = ".", cex = 2, ylab="Age")

qqmath(na.aggregate(data.df$Publications), distribution = qnorm, type = c("p", "g"),
       aspect = "xy", pch = ".", cex = 2, ylab="Publications")


#Shapiro Normal Distribution test
shapiro.test(na.aggregate(data.df$Age))

shapiro.test(data.df$Publications)

#Kolmogorov-smirnov Normal Distribution test
ks.test(na.aggregate(data.df$Age), rnorm(200, mean(na.aggregate(data.df$Age)), sd(na.aggregate(data.df$Age))))

#Kolmogorov-Smirnov Normal Distribution test ???
ks.test(data.df$Publications, rnorm(200, mean(data.df$Publications)))

#t-Student Test
t.test(na.aggregate(data.df[data.df$Gender=="male","Age"]), y = na.aggregate(data.df[data.df$Gender=="female","Age"]), var.equal=TRUE)

#Wilcoxon
wilcox.test(na.aggregate(data.df[data.df$Gender == "male", "Publications"]), y = na.aggregate(data.df[data.df$Gender == "female", "Publications"]))

#ANOVA
library(zoo)
data.df.new <- na.aggregate(data.df, by="Age", FUN = mean)
data.anova <- aov(Age~Tasks, data = data.df.new)
summary(data.anova)
TukeyHSD(data.anova)
#Or either way
library(userfriendlyscience)
oneway(y=data.df$Age, x = data.df$Tasks, posthoc="games-howell", means=T, fullDescribe=T, levene=T,
       plot=T, digits=2, pvalueDigits=3, conf.level=.95)

#Kruskal-Wallis
kruskal.test(Publications~Tasks, data = data.df)
kruskal.test(list(data.df[data.df$Tasks=="PhD_Student","Publications"],data.df[data.df$Tasks=="Postdoctoral_research","Publications"],data.df[data.df$Tasks=="Phd_Supervisor","Publications"]))
library(pgirmess)
kruskalmc(Publications ~ Tasks, data = data.df)

#chi-squared GendervsR
tbl <- table(data.df$Gender, data.df$R_user)
chisq.test(tbl)

#chi-squared GendervsPython
tbl <- table(data.df$Gender, data.df$Python_user)
chisq.test(tbl)

#chi-squared GendervsTasks
tbl <- table(data.df$Gender, data.df$Tasks)
chisq.test(tbl)


#Correlation Publications ~ Age
cor.test(data.df$Publications, na.aggregate(data.df$Age), method="spearman")

#p-value
pt(data.df$Age, df = 9, lower.tail = FALSE)

#t test
t.test(data.df$Age, alternative = "greater")

#t test with two samples
t.test(data.df$Age, data.df$Publications,
       alternative = "greater", paired = TRUE)



##inference - END##