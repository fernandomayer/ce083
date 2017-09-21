##======================================================================
## Resolução dos exercícios da página entrada-dados.html
##======================================================================

##----------------------------------------------------------------------
## ---- ex2
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
