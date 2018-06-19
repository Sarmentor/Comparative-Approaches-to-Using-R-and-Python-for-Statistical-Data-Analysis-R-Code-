install.packages("StatRank")

3+2*5
x <- 3^2
x
sqrt(x)

vector <- 1:10
vector

vector + 2

vector2 <- 3:12
vector2

vector + vector2

mode(vector)

char.vector <- c("String1","String2","String3")
mode(char.vector)

num.vector <- c(12.5,5.64,7.84)
mode(num.vector)

length(vector)
length(char.vector)
length(num.vector)

char.vector[1]
char.vector[1:2]
char.vector[c(1,2)]
char.vector[c(1,3)]

names(num.vector) <- c("Math Grade", "French Grade", "German Grade")
num.vector

num.vector["Math Grade"]
num.vector[c("Math Grade","German Grade")]

num.vector[num.vector > 10]
num.vector[num.vector < 10 & num.vector > 6]
num.vector[num.vector > 10 | num.vector < 6]

add <- function(x,y){
  x+y
} 

add(x=2,y=2)

max(num.vector)
min(num.vector)
mean(num.vector)
sd(num.vector)
summary(num.vector)

students <- c("John","Mike","Vera","Sophie","Anna","Vera","Vera","Mike","Anna")
courses <- c("Math","Math","Math","Research","Research 2","Research","Research 2","Computation","Computation")
grades <- c(13,13,14,16,16,13,17,10,14)

table (students)
table (students, courses)

courses.factors <- factor(courses)
courses.factors

levels(courses.factors)

my.dataframe <- data.frame(student=students, course=courses, grade=grades)
my.dataframe
edit(my.dataframe)

my.empty.dataframe <- data.frame()
edit(my.empty.dataframe)

my.dataframe$student
my.dataframe[,1]

my.dataframe$student[1]
my.dataframe[,1][1]

my.dataframe$grade > 14
my.dataframe$student[my.dataframe$grade > 14]

my.dataframe
my.dataframe[3,3] <- 16
my.dataframe

my.dataframe$grade[my.dataframe$student=="Vera" & my.dataframe$course == "Math"] <- 16

nrow(my.dataframe)
ncol(my.dataframe)
colnames(my.dataframe)
rownames(my.dataframe)
mode(my.dataframe)
class(my.dataframe)
summary(my.dataframe)

my.matrix <- matrix(c(12,13,14,10,12,15,16,12), nrow=2, ncol=4)
my.matrix

my.matrix <- matrix(,2,4)
data.entry(my.matrix)

my.matrix[1,]
my.matrix[1,4]
my.matrix[,4]

rownames(my.matrix) <- c("Vera","Mike")
colnames(my.matrix) <- c("W1","W2","W3","W4")
my.matrix
my.matrix["Vera","W4"]

csv.file <- read.csv("test.csv")
csv.file


library(xlsx) #load the package
write.xlsx(x = my.dataframe, file = "my_excel_file.xlsx",sheetName = "Sheet 1", row.names = FALSE)
