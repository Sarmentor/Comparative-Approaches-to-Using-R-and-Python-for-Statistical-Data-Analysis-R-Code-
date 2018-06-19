##Clustering Analysis - BEGIN##

### Euclidean distance matrix
# Filtering some data from 2015
newdata<-data[data$Year>=2015,]
# Distance ́s matrix
d <- dist(as.matrix(newdata[,paste("Q", 1:10, sep="")], method="euclidean") )
d

### Hierarchical clustering
# Single-linkage clustering (method= “single”)
hc <- hclust(d, method = "single")
plot(hc)

# Complete-linkage clustering (method= “complete” by default)
hc <- hclust(d)
plot(hc)

# Draws rectangles around the branches of a dendrogram highlighting the corresponding clusters
rect.hclust(hc, k = 2)

### Clustering with k-means
# Selecting data
newdata <- newdata[,paste("Q", 1:10, sep="")]
# K-means cluster analysis
fit <- kmeans(newdata, 2)
# Append cluster assignment
newdata <- data.frame(newdata, fit$cluster)

##Clustering Analysis - END##