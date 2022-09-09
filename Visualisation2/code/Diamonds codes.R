getwd()
library(ggplot2)
head(diamonds, n= 10)
n = nrow(diamonds)
qplot(carat, price, data = diamonds)
#We see a non-linear relationship between Carat and Price
qplot(log(carat),log(price), data = diamonds)
id = 1:5000
small = diamonds[id,]
qplot(log(carat),log(price), data = small)
set.seed(100)
id = sample(1:n, size = 5000, replace = FALSE)
small = diamonds[id,]
qplot(log(carat),log(price), data = small)
qplot(log(carat),log(price), data = small, alpha = I(1/10))
qplot(log(carat),log(price), data = small, colour = cut)
qplot(log(carat),log(price), data = small, colour = color)
qplot(log(carat),log(price), data = small, colour = color,geom = c("point","smooth"))
qplot(log(carat),log(price), data = small,geom = c("point","smooth"))
# qplot(log(carat),log(price), data = small,geom = c("point","smooth"))
#`geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")' 
#gam stands for generalized additive model
qplot(color, price/carat, data = small )
qplot(color, price/carat, data = small, geom = "jitter" )
