library(ggplot2)
n = nrow(diamonds)
set.seed(100)
id = sample(1:n, size = 5000, replace = FALSE)
small = diamonds[id,]
qplot(carat, price, data = small)
summary(small)
#Creating layered graph without using ggplot
plot(NULL,xlim = c(0,3), ylim =c(0,20000), xlab = "carat", ylab = "price")
grid(col = "grey", lty = 3, lwd = 2)
points(small$carat, small$price, pch = 2)
#Creating the same layered graph using ggplot
ggplot(small, aes(carat, price))+
  geom_point()

ggplot(small, aes(carat, price))+
  geom_line()
#the above representation is not meaningful

ggplot(small, aes(carat, price,
                  colour = factor(cut)))+
  geom_point()

ggplot(small, aes(carat, price,
                  colour = factor(cut),
                  shape = factor(color)))+
  geom_point()
#putting many information in a single graph can be cluttered

ggplot(small, aes(carat, price,
                  colour = factor(color),
                  shape = factor(cut)))+
  geom_point()
ggplot(small, aes(log(carat), log(price),
                  colour = factor(color),
                  shape = factor(cut)))+
  geom_point()
ggplot(small, aes(log(carat), log(price)
                  ))+
  geom_point()+
  geom_smooth()