##======================================================================
## Analise exploratória de dados
##======================================================================

##----------------------------------------------------------------------
## Importar os dados do Gapminder em
## http://www.leg.ufpr.br/~fernandomayer/data
url <- "http://www.leg.ufpr.br/~fernandomayer/data/pib_gapminder.csv"
## Importando pela url
dados <- read.table(url, header = TRUE,
                    sep = ",", dec = ".", as.is = TRUE)
str(dados)

##----------------------------------------------------------------------
## Analise exploratoria de dados

## Identificando variaveis

## Quais sao os paises?
unique(dados$pais)
length(unique(dados$pais))
# Quantos casos para cada pais (tabela de frequencia)
length(dados$pais[dados$pais == "Brazil"])
table(dados$pais)

## Quantos anos existem? Quais?
unique(dados$ano)
length(unique(dados$ano))
table(dados$ano)

## Quais são os continentes?
unique(dados$continente)
length(unique(dados$continente))
table(dados$continente)
table(dados$continente)/sum(table(dados$continente))
prop.table(table(dados$continente))
addmargins(table(dados$continente))
addmargins(prop.table(table(dados$continente)))

## Tabelas de dupla entrada
table(dados$ano, dados$continente)
addmargins(table(dados$ano, dados$continente))

## Graficos para variaveis qualitativas
barplot(table(dados$continente))
barplot(table(dados$continente),
        xlab = "Continentes",
        ylab = "Frequência",
        main = "Ocorrência dos continentes")
barplot(sort(table(dados$continente)))
barplot(sort(table(dados$continente), decreasing = TRUE))

pie(table(dados$continente))

## Variaveis quantitativas
mean(dados$expVida)
sd(dados$expVida)
var(dados$expVida)
cv(dados$expVida)
sd(dados$expVida)/mean(dados$expVida)
## Criando a função CV
cv <- function(x){
    sd(x)/mean(x)
}
class(cv)
max(dados$expVida)
min(dados$expVida)
range(dados$expVida)
amp(dados$expVida)
max(dados$expVida) - min(dados$expVida)
diff(range(dados$expVida))

amp <- function(x){
    diff(range(x))
}

summary(dados$expVida)
quantile(dados$expVida)
fivenum(dados$expVida)

## Construindo tabelas de frequencia para var. quantitativas
sqrt(length(dados$expVida))
nclass.Sturges(dados$expVida)
nclass.FD(dados$expVida)
range(dados$expVida)
seq(23.599, 82.603, length.out = 12)
diff(seq(23.599, 82.603, length.out = 12))
classes <- cut(dados$expVida,
               breaks = seq(23.599, 82.603, length.out = 12),
               include.lowest = TRUE)
classes
table(classes)
addmargins(table(classes))
dim(dados)
length(classes)

## Frequencia relativa
prop.table(table(classes))
addmargins(prop.table(table(classes)))
cbind("f" = addmargins(table(classes)),
      "fr" = addmargins(prop.table(table(classes))))

# Histograma
hist(dados$expVida)
hist(dados$expVida,
     breaks = seq(23.599, 82.603, length.out = 12),
     include.lowest = TRUE)
hist(dados$expVida, nclass = 30)

hist(dados$expVida, freq = FALSE, labels = TRUE)

# Boxplot
boxplot(dados$expVida)
boxplot(dados$pibPercap)

par(mfrow = c(1, 2))
boxplot(dados$expVida[dados$pais == "Brazil"],
        ylim = c(40, 80),
        ylab = "Expectativa de vida",
        main = "Brasil")
boxplot(dados$expVida[dados$pais == "Uruguay"],
        ylim = c(40, 80),
        ylab = "Expectativa de vida",
        main = "Uruguai")
par(mfrow = c(1, 1))
length(unique(dados$pais))

boxplot(expVida ~ pais, data = dados)
boxplot(expVida ~ continente, data = dados)

## Fazer boxplots de expVida para os paises:
# Brasil
# Uruguai
# Argentina
# Chile
# Paraguai
# Colombia
# Equador
## Veja ?subset
boxplot(dados$expVida[dados$pais == "Brazil"])
boxplot(dados$expVida, subset = dados$pais == "Brazil")
## Usando o argumento subset
boxplot(expVida ~ pais, data = dados, subset = pais == "Brazil")
boxplot(expVida ~ pais, data = dados,
        subset = pais %in% c("Brazil", "Uruguay"))
boxplot(expVida ~ pais, data = dados,
        subset = pais %in% c("Brazil", "Uruguay", "Argentina"))
## Fazendo um subset e criando novo objeto
paises <- c("Brazil", "Uruguay", "Argentina", "Chile", "Paraguai",
            "Colombia", "Equador")
dados2 <- subset(dados, pais %in% paises)
dim(dados2)
table(dados2$pais)
## Não estão todos os paises. Como descobrir os nomes corretos?
grep("Eq", dados$pais)
grep("Eq", dados$pais, value = TRUE)
grep("E", dados$pais, value = TRUE)
grep("^E", dados$pais, value = TRUE)
grep("^[E].*r$", dados$pais, value = TRUE)
grep("Para", dados$pais, value = TRUE)
paises <- c("Brazil", "Uruguay", "Argentina", "Chile", "Paraguay",
            "Colombia", "Ecuador")
dados2 <- subset(dados, pais %in% paises)
dim(dados2)
str(dados2)
table(dados2$pais)
boxplot(expVida ~ pais, data = dados2)
boxplot(expVida ~ pais, data = dados2, las = 3) # ver outros las

## Usando o pacote lattice
library(lattice)
bwplot(~ expVida | pais, data = dados2)
bwplot(expVida ~ pais, data = dados2)
bwplot(expVida ~ pais | ano, data = dados2)
bwplot(expVida ~ pais | ano, data = dados2,
       scales = list(x = list(rot = 90)))
histogram(~ expVida | pais, data = dados2)
histogram(~ expVida | pais, data = dados2)

##----------------------------------------------------------------------
## Tabelas resumo (familia *apply)

## FUN por coluna
apply(dados2[, 5:6], 2, mean)
apply(dados2[, 5:6], 2, var)
apply(dados2[, 5:6], 2, sd)
apply(dados2[, 5:6], 2, fivenum)
apply(dados2[, 5:6], 2, summary)

## Usando s/lapply
sapply(dados2[, 5:6], mean)
lapply(dados2[, 5:6], mean)
sapply(dados2[, 5:6], summary)
lapply(dados2[, 5:6], summary)
## Do exemplo em ?lapply
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
x
lapply(x, mean)
lapply(x, quantile)
sapply(x, quantile)

## tapply calcula por categoria
with(dados2, tapply(expVida, pais, mean))
with(dados2, tapply(expVida, pais, var))
with(dados2, tapply(expVida, pais, summary))
## Com duas variaveis separadoras
with(dados2, tapply(expVida, list(pais, ano), mean))
with(dados2, tapply(expVida, list(ano, pais), mean))
with(dados2, tapply(expVida, list(continente, pais), mean))
## Com tres gera um array
with(dados2, tapply(expVida, list(ano, continente, pais), mean))
with(dados2, tapply(expVida, list(ano, pais, continente), mean))
## Com duas variaveis resposta ...
with(dados2, tapply(data.frame(expVida, pibPercap), pais, mean))
## ... tem que usar o aggregate
with(dados2, aggregate(expVida, list(pais), mean))
aggregate(expVida ~ pais, data = dados2, mean) # mais facil
## Com mais de uma variavel
with(dados2, aggregate(cbind(expVida, pibPercap), list(pais), mean))
aggregate(cbind(expVida, pibPercap) ~ pais, data = dados2, mean)
## Com mais de um divisor
with(dados2, aggregate(expVida, list(pais, ano), mean))
aggregate(expVida ~ pais + ano, data = dados2, mean) # mais facil
## Com duas variaveis e dois divisores
with(dados2, aggregate(cbind(expVida, pibPercap), list(pais, ano), mean))
aggregate(cbind(expVida, pibPercap) ~ pais + ano, data = dados2, mean)
## E para fazer com mais de uma função?
## Ver a função ddply do pacote plyr

##----------------------------------------------------------------------
## Algumas opções de gráficos de dispersão
plot(expVida ~ pibPercap, data = dados2)
plot(expVida ~ pibPercap, data = dados2, subset = pais == "Brazil")
xyplot(expVida ~ pibPercap, data = dados2)
xyplot(expVida ~ pibPercap, data = dados2,
       groups = pais, auto.key = list(columns = 4))
xyplot(expVida ~ pibPercap, data = dados2,
       groups = pais, auto.key = list(columns = 4),
       type = c("p", "smooth"))
xyplot(expVida ~ pibPercap | pais, data = dados2)
xyplot(expVida ~ pibPercap | pais, data = dados2, as.table = TRUE)
xyplot(expVida ~ pibPercap | pais, data = dados2, as.table = TRUE,
       type = c("p", "smooth"))
