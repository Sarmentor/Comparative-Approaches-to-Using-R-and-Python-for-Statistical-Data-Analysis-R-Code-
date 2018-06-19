##Factorial Analysis - BEGIN##

### Descriptive analysis of Q1 to Q10 variables
# Identification of the variables used in factor analysis
survey<-data.df[, paste("Q", 1:10, sep="")]
# Descriptive analysis for each variable
summary(survey)

### Correlation between variables Q1 to Q10
correlation <- cor(survey, method="spearman")
correlation

### Bartlett Sphericity test
library (psych)
cortest.bartlett(correlation, n=nrow(data))

### KMO Measure
library (psych)
KMO(correlation)

### Kaiser criterion
library (psych)
eigen(correlation)

### Scree plot criterion
library(nFactors)
scree(correlation, hline=-1) # hline=-1 draw a horizontal line at -1

### Explained variance for each component
pc <- prcomp(survey,scale.=F)
summary(pc)

### Principal Component method
library (psych)
principal(correlation,nfactors=3, rotate="none")

### Principal Component method
new.correlation<-correlation[!(colnames(correlation) %in% c("Q6", "Q8","Q10")),!(rownames(correlation) %in% c("Q6", "Q8", "Q10"))]
new.correlation
library (psych)
principal(new.correlation,nfactors=3, rotate="none")

### Principal Component method with varimax rotation
library (psych)
principal(correlation,nfactors=3, rotate="varimax")

### Principal Component method
library (psych)
principal(new.correlation,nfactors=3, rotate="varimax")

### Internal consistency
# PC1 (Q1, Q6, Q7, Q9, Q10)
library (psych)
alpha(survey[c("Q1", "Q6", "Q7", "Q9", "Q10")])

### Internal consistency
# PC2 (Q4, Q5, Q8)
library (psych)
alpha(survey[c("Q4", "Q5", "Q8")])

### Internal consistency
# PC3 (Q2, Q3)
library (psych)
alpha(survey[c("Q2", "Q3")])

##Factorial Analysis - END##