data("iris")
pdf(file = "outputs/Scatter_plot_1.pdf", paper = "A4r")

# Use the iris dataset to reproduce the plot (by "plot")
d.setosa<-iris[iris$Species=='setosa',]
d.versicolor<-iris[iris$Species=='versicolor',]  
d.virginica<-iris[iris$Species=='virginica',] 
  
x_range <- range(1, iris$Petal.Length)
y_range <- range(0, iris$Petal.Width)
x_range
y_range

plot(d.setosa$Petal.Length, d.setosa$Petal.Width,
     xlim=x_range ,ylim=y_range, main="Petal width vs. length",
     xlab="Petal length (cm)", ylab="Petal width (cm)", axes=FALSE)
lines(d.versicolor$Petal.Length, d.versicolor$Petal.Width,
      type = "p", pch=2, col="red", xlim=x_range ,ylim=y_range, axes=FALSE, ann=FALSE)
lines(d.virginica$Petal.Length, d.virginica$Petal.Width,
      type = "p", pch=3, col="green", xlim=x_range ,ylim=y_range, axes=FALSE, ann=FALSE)

axis(1, at=seq(1,7))
axis(2, at=seq(0.5, 2.5,by=0.5))
box()

legend("topleft", legend=c("setosa","versicolor","virginica"),
       col=c("black","red","green"), pch=1:2:3 )

abline(lm(iris$Petal.Width ~ iris$Petal.Length), col="black")
text(5, 0.5, paste("R =", round(cor(iris$Petal.Length, iris$Petal.Width), 2)))

dev.off()

# Explore the function pairs allowing to generate a matrix of scatter plots between variables pairs

pdf(file = "outputs/Scatter_plot_2.pdf", paper = "A4r")

pairs(iris[1:4], 
      col=c("black", "red", "green")[iris$Species], 
      pch=c(1, 2, 3)[iris$Species], 
      main="Petal width vs. length")

dev.off()