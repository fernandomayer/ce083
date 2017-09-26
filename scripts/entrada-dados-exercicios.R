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
