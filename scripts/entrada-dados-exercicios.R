##======================================================================
## Resolução dos exercícios da página entrada-dados.html
##======================================================================

##----------------------------------------------------------------------
## ---- ex1
a <- scan()
b <- scan(what = "character")
c <- scan(what = "logical")

##----------------------------------------------------------------------
## ---- ex2
## a.
da <- read.table("dados/prb0519.dat", header = TRUE)
str(da)
## b.
db <- read.table("dados/tab0303.dat", header = TRUE)
str(db)
## c.
dc <- read.table("dados/tab1208.dat", header = TRUE)
str(dc)
## d.
dd <- read.table("dados/ReadMe.txt", header = TRUE, skip = 2, dec = ",")
str(dd)
## e.
de <- read.table("dados/montgomery_6-26.csv", header = TRUE, sep = ",")
str(de)
## f.
df <- read.table("dados/montgomery_14-12.txt", header = TRUE)
str(df)
## g.
dg <- read.table("dados/montgomery_ex6-2.csv", header = TRUE, sep = ",")
str(dg)
## h.
dh <- read.table("dados/ipea_habitacao.csv", header = TRUE, sep = ",")
str(dh)
## i.
di <- read.table("dados/stratford.csv", header = TRUE, sep = "\t")
str(di)

##----------------------------------------------------------------------
## ---- ex3
## a.
url <- "http://leg.ufpr.br/~fernandomayer/data/BHH2/prb0519.dat"
da <- read.table(url, header = TRUE)
str(da)
## b.
url <- "http://leg.ufpr.br/~fernandomayer/data/BHH2/tab0303.dat"
db <- read.table(url, header = TRUE)
str(db)
## c.
url <- "http://leg.ufpr.br/~fernandomayer/data/BHH2/tab1208.dat"
dc <- read.table(url, header = TRUE)
str(dc)
## d.
url <- "http://leg.ufpr.br/~fernandomayer/data/BHH2/ReadMe.txt"
dd <- read.table(url, header = TRUE, skip = 2, dec = ",")
str(dd)
## e.
url <- "http://leg.ufpr.br/~fernandomayer/data/montgomery_6-26.csv"
de <- read.table(url, header = TRUE, sep = ",")
str(de)
## f.
url <- "http://leg.ufpr.br/~fernandomayer/data/montgomery_14-12.txt"
df <- read.table(url, header = TRUE)
str(df)
## g.
url <- "http://leg.ufpr.br/~fernandomayer/data/montgomery_ex6-2.csv"
dg <- read.table(url, header = TRUE, sep = ",")
str(dg)
## h.
url <- "http://www.leg.ufpr.br/~fernandomayer/data/ipea_habitacao.csv"
dh <- read.table(url, header = TRUE, sep = ",")
str(dh)
## i.
url <- "http://www.leg.ufpr.br/~fernandomayer/data/stratford.csv"
di <- read.table(url, header = TRUE, sep = "\t")
str(di)

##----------------------------------------------------------------------
## ---- ex4
## 2.
## Os dados estão disponíveis em
## http://www.leg.ufpr.br/~fernandomayer/data/dados_ex4.csv
## 3.
ex4 <- read.table("dados/dados_ex4.csv", header = TRUE,
                  sep = ",", dec = ".")
str(ex4)
## 4.
ex4$Numero2 <- ex4$Numero * 2
str(ex4)
## 5.
write.table(ex4, "dados/dados_ex4_v2.csv", row.names = FALSE,
            sep = ",", dec = ".")
## 6.
Condicao <- rep(c("Fumante", "Nao fumante"), each = 5, times = 2)
Sexo <- rep(c("Masculino", "Feminino"), each = 10)
Numero <- c(49, 64, 37, 52, 68, 27, 58, 52, 41, 30,
            54, 61, 79, 64, 29, 40, 39, 44, 34, 44)
ex4.manual <- data.frame(Condicao, Sexo, Numero)
str(ex4.manual)
all.equal(ex4[, -4], ex4.manual)
