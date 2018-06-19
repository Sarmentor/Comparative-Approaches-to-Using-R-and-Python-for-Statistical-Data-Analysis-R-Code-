
data.df <- read.table(file = "data.csv", header = TRUE, sep = ";")

#mudanças de variaveis
data.df[which(data.df[,2]==1),2]="male"
data.df[which(data.df[,2]==2),2]="female"
data.df[which(data.df[,c(3)]==1),3]="yes"
data.df[which(data.df[,c(4)]==0),4]="no"
data.df[which(data.df[,c(4)]==1),4]="yes"
data.df[which(data.df[,c(3)]==0),3]="no"
data.df[which(data.df[,c(7)]==1),7]="Phd_Supervisor"
data.df[which(data.df[,c(7)]==2),7]="Postdoctoral_research"
data.df[which(data.df[,c(7)]==3),7]="PhD_Student"

##descriptive statistics - BEGIN##

#Names of variables and also row names

colnames(data.df)
rownames(data.df)


# mean,median,25th and 75th quartiles,min,max
summary(data.df[,c("Age","Publications")])

# mean,median,25th and 75th quartiles,min,max
summary(data.df[,c(5,6)])


# Frequency of Gender
Freq.Gender <- as.numeric(table(data.df[,"Gender"]))
CFreq.Freq.Gender <- cumsum(Freq.Gender)
Rel.Freq.Gender <- as.numeric(prop.table(Freq.Gender))
Freqs.Gender <- data.frame(Gender = levels(factor(data.df[,"Gender"])), Frequency = Freq.Gender, Cumulative.Frequency = CFreq.Freq.Gender, Relative.Frequency = Rel.Freq.Gender)


# Frequency of Python_user with missings value
Freq.Python <- as.numeric(table(data.df[,"Python_user"], exclude=NULL))
CFreq.Freq.Python <- cumsum(Freq.Python)
Rel.Freq.Python <- as.numeric(prop.table(Freq.Python))
Freqs.Python <- data.frame(Python.user = levels(factor(data.df[,"Python_user"], exclude = NULL)), Frequency = Freq.Python, Cumulative.Frequency = CFreq.Freq.Python, Relative.Frequency = Rel.Freq.Python)

# Frequency of R_user
Freq.R <- as.numeric(table(data.df[,"R_user"]))
CFreq.Freq.R <- cumsum(Freq.R)
Rel.Freq.R <- as.numeric(prop.table(Freq.R))
Freqs.R <- data.frame(R.user = levels(factor(data.df[,"R_user"])), Frequency = Freq.R, Cumulative.Frequency = CFreq.Freq.R, Relative.Frequency = Rel.Freq.R)

# Frequency of Age
Freq.Age <- as.numeric(table(data.df[,"Age"]))
CFreq.Freq.Age <- cumsum(Freq.Age)
Rel.Freq <- as.numeric(prop.table(Freq.Age))
Freqs.Age <- data.frame(Age = levels(factor(data.df[,"Age"])), Frequency = Freq.Age, Cumulative.Frequency = CFreq.Freq.Age, Relative.Frequency = Rel.Freq)

# Frequency of Publications
Freq.Pub <- as.numeric(table(data.df[,"Publications"]))
CFreq.Freq.Pub <- cumsum(Freq.Pub) 
Rel.Freq.Pub <- as.numeric(prop.table(Freq.Pub))
Freqs.Pub <- data.frame(Publications = levels(factor(data.df[,"Publications"])), Frequency = Freq.Pub, Cumulative.Frequency = CFreq.Freq.Pub, Relative.Frequency = Rel.Freq.Pub)

#class interval variable
library(classInt)

pub.classes <- classIntervals(data.df[,"Publications"], n=11, style =  "fixed", fixedBreaks=c(20, 40, 50, 60,150), rtimes = 3,intervalClosure = c("right"), dataPrecision = NULL)

#histogram of publications
hist(data.df[,"Publications"],breaks=c(20, 40, 50, 60,150), right = TRUE, freq=TRUE, ylab = "Frequencies", xlab="# of Publications", main="Histogram for Publications",include.lowest=TRUE)

#Pie charts

#Gender
# Pie Chart from data frame with Appended Sample Sizes
mytable <- table(data.df[,"Gender"])
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls,
    main="Pie Chart of Gender Variable\n (with sample sizes)") 

library(plotrix)
pie3D(mytable, labels = lbls,explode=0.1,
    main="Pie Chart of Gender Variable\n (with sample sizes)")

#Python_user
# Pie Chart from data frame with Appended Sample Sizes
mytable <- table(data.df[,"Python_user"])
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls,
    main="Pie Chart of Python users Variable\n (with sample sizes)") 

library(plotrix)
pie3D(mytable, labels = lbls,explode=0.1,
      main="Pie Chart of Python users Variable\n (with sample sizes)") 

#R_user
# Pie Chart from data frame with Appended Sample Sizes
mytable <- table(data.df[,"R_user"])
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls,
    main="Pie Chart of R users Variable\n (with sample sizes)") 

library(plotrix)
pie3D(mytable, labels = lbls,explode=0.1,
      main="Pie Chart of R users Variable\n (with sample sizes)") 

#barplots
#Tasks
barplot(table(data.df[,"Tasks"]), col=c(1,2,3), ylim = c(0, 80))

#Boxplots
#Age
# Boxplot of Age
boxplot(data.df[,"Age"],data=data.df, main="Scientific Researchers Data",
        xlab="", ylab="Age of Researchers")

# Boxplot of Publications
boxplot(data.df[,"Publications"],data=data.df, main="Scientific Researchers Data",
        xlab="", ylab="Pubications of Researchers")

# Boxplot of PubsvsAge
boxplot(Publications~Age,data=data.df, main="Scientific Researchers Data",
        xlab="Age of Researchers", ylab="Number of Publications") 


# Tukey min,lower-hinge, median,upper-hinge,max
fivenum(data.df$Age)
fivenum(data.df$Publications)


##descriptive statistics - END##