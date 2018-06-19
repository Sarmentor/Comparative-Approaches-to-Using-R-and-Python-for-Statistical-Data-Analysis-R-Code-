#Read Data
data<-read.table("data.csv", sep=";", header = TRUE) 


#remove line with NA’s
data<-na.omit(data)

#Replace values
data$Gender<-ifelse(data$Gender=="female", 1, 0)
#Replace values
data$Python_user<-ifelse(data$Python_user=="yes", 1, 0)

#Output example sample before pre-processing
data[1:10, "R_user"]
#Replace values
data$R_user<-ifelse(data$R_user=="yes", 1, 0)
#Output example sample after pre-processing
data[1:10, "R_user"]