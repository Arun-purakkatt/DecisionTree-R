

#Decision tree in R
install.packages("tree",repos = "https://cran.r-project.org")
library(c50)
data()
data("iris")
write.csv(iris,"irisdataset.csv")
iris
summary(iris)

#splitting as train & Test

iris_setosa <- iris[iris$Species == "setosa",]
iris_versicolor<-iris[iris$Species == "versicolor", ]
iris_virginica<-iris[iris$Species == "virginica", ]
View(iris_setosa)
View(iris_versicolor)
View(iris_virginica)

#splitting as train & test - Sequential split
iris_train<-rbind(iris_setosa[1:35,],iris_versicolor[1:35,],iris_virginica[1:35,])
iris_test<-rbind(iris_setosa[36:50,],iris_versicolor[36:50,],iris_virginica[36:50,])
View(iris_train)
View(iris_test)

#splitting as train & test - random split
install.packages("caret",dependencies=TRUE)

attach(iris)
inTrain <- createDataPartition(y=iris$Species,p=0.70,list= FALSE)
inTrain
train <- iris[inTrain,]
View(train)
test<-iris[-inTrain,]
View(test)
#Building model on training Data
install.packages("C50",dependencies=TRUE,repos="https://cran.r-project.org")
library(C50)
m1 <- C5.0(train[,-5],train$Species)
plot(m1)
#Accuracy
pv<-predict(m1,newdata=test)
pv
mean(test$Species==pv)
(test$Species==pv)
table(test$Species)

install.packages("gmodels",dependencies=TRUE,repos = "https://cran.r-project.org")
library(gmodels)
summary(iris)
CrossTable(test$Species,predict(m1,test))
summary(test)



