##======================================================================
## Resolução dos exercícios da página indexacao_e_selecao.html
##======================================================================

##----------------------------------------------------------------------
## ---- ex1
## 1.
x <- c(88, 5, 12, 13)
x
## 2.
x[3]
## 3.
x[1]
## 4.
x[c(4, 2)]
## 5.
x[-c(1, 4)]
## 6.
y <- c(x[1:3], 168, x[4])
y
## Ou
append(x, 168, after = 3)

##----------------------------------------------------------------------
## ---- ex2
## 1.
mm <- matrix(c(4, 10, 9, 2, 16, 5, 9, 0, 2, 11, 5, NA), nrow = 4)
## 2.
mm[4, 2]
## 3.
mm[-3, -2]
## 4.
ll <- list(v1 = 1:10, v2 = letters[1:7], mm = mm)
ll
## 5.
ll[[1]][5:3]
ll$v1[5:3]
## 6.
ll[[2]][-c(2,6)]
ll$v2[-c(2,6)]
## 7.
ll[[3]][, 3]
ll$mm[, 3]
## 8.
ll$v3 <- rnorm(30, mean = 12, sd = 2)
## 9.
dd <- data.frame(Letras = LETTERS[1:10],
                 Numeros = c(runif(7, 1, 5), rep(NA, 3)))
dd
## 10.
dd[1:2, ]
head(dd, 2)
## 11.
dd[9:10, ]
tail(dd, 2)
## 12.
dd[6, 1]
## 13.
dd[4, 2]
## 14.
sum(is.na(dd))
## 15.
dd <- dd[complete.cases(dd), ]
## 16.
dd$Nova <- 1:7
dd
## 17.
ll$l1 <- list(A = 1:5, B = letters[1:6])
ll
## 18.
ll$l1$A[4]
## 19.
ll$l1$B[3]

##----------------------------------------------------------------------
## ---- ex3
## 1.
x <- c(3, 8, 10, 4, 9, 7, 1, 9, 2, 4)
## 2.
x[x >= 5]
## 3.
x[x != 4]
## 4.
x[x > 4 & x < 8]
## 5.
a <- LETTERS[1:10]
## 6.
x[a == "F"]
## 7.
x[a %in% c("B", "D", "H")]
## 8.
which(x == 10)
## 9.
which(x >= 8 & x <= 10)
## 10.
which(a %in% c("A", "B", "D"))

##----------------------------------------------------------------------
## ---- ex4
## 1.
dados <- data.frame(caranguejos = c(42, 34, 59, 18),
                    praias = c("Joaquina", "Campeche", "Armação",
                               "Praia Mole"))
dados
## 2.
dados[dados$caranguejos < 30, "praias"]
dados$praias[dados$caranguejos < 30]
## 3.
dados$regiao <- NA
dados$regiao[dados$praias %in% c("Joaquina", "Praia Mole")] <- "leste"
dados$regiao[dados$praias %in% c("Campeche", "Armação")] <- "sul"
dados
## 4.
dados$praias[dados$regiao == "leste" & dados$caranguejos < 20]
## 5.
dados$praias[dados$regiao == "sul" & dados$caranguejos > 40]
## 6.
dados$regiao[dados$caranguejos > 50]

##======================================================================
