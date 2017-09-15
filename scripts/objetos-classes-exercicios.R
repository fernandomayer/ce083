##======================================================================
## Resolução dos exercícios da página objetos-classes.html
##======================================================================

##----------------------------------------------------------------------
## ---- ex1
## 1.
runif(30, 0, 1)
runif(30, max = 5, min = -5)
runif(min = 10, max = 500, n = 30)
## 2.
?"+"
## 3.
soma <- function(x, y){
    x + y
}
soma(x = 2, y = 4)
soma(2, 4)

##----------------------------------------------------------------------
## ---- ex2
## 1.
x <- 32 + 16^2 - 25^3
## 2.
y <- x/345
## 3.
uni <- runif(30, 10, 50)
## 4.
rm(y)
## 5.
rm(list = ls())
## 6.
rpois(100, lambda = 5)

##----------------------------------------------------------------------
## ---- ex3
## 1.
x <- c(54, 0, 17, 94, 12.5, 2, 0.9, 15)
## 2.
x + c(5, 6)

##----------------------------------------------------------------------
## ---- ex4
## 1.
x <- rep(c("A", "B", "C"), times = c(15, 12, 8))
## 2.
x == "B"
## 3.
sum(x == "B")
## 4.
set.seed(11) # para que o resultado seja sempre o mesmo
y <- runif(100)
y >= 0.5
sum(y >= 0.5)

##----------------------------------------------------------------------
## ---- ex5
## 1.
int <- 1:50
x <- 2^int
x
# a.
y <- int^2
y
# b.
x == y
x[x == y] # avançado
# c.
sum(x == y)
## 2.
x <- seq(0, 2*pi, by = 0.1)
a <- sin(x)
b <- cos(x)
c <- tan(x)
# a.
c2 <- a/b
# b.
difer <- c - c2
difer
# c.
difer == 0
all.equal(c, c2)
identical(c, c2)
# d.
max(difer)
max(abs(difer))

##----------------------------------------------------------------------
## ---- ex6
## 1.
mm <- matrix(c(2, 8, 4,
               0, 4, 1,
               9, 7, 5),
             ncol = 3, byrow = TRUE)
mm
## 2.
colnames(mm) <- c("A", "B", "C")
rownames(mm) <- c("x", "y", "z")
mm
## 3.
ml <- list(rep(c("A", "B", "C"), times = c(2, 5, 4)),
           mm)
ml
## 4.
names(ml)
names(ml) <- c("vetor", "matriz")
ml
## 5.
praias <- as.factor(caracter)
praias
ml$praias <- praias
ml
## 6.
dados <- data.frame(caranguejos = c(42, 34, 59, 18),
                    praias = c("Joaquina", "Campeche", "Armação",
                               "Praia Mole"))
dados

##======================================================================
