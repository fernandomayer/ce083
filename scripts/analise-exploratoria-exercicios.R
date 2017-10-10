##======================================================================
## Resolução dos exercícios da página analise-exploratoria.html
##======================================================================

##----------------------------------------------------------------------
## ----- ex2
## Carregando o conjunto de dados
data(women)

## Verificando a estrutura dos dados
str(women)
head(women)
tail(women)

## Sumário estatístico
summary(women)

## Distribuição (gráficos)

## Distribuição de cada variável
par(mfrow = c(2, 2)) # divide a janela gráfica em 2 linhas e 2 colunas
# Histogramas
hist(women$height)
hist(women$weight)
# Boxplot
boxplot(women$height, horizontal = TRUE)
boxplot(women$weight, horizontal = TRUE)
par(mfrow = c(1, 1)) # volta a janela gráfica par 1 linha e 1 coluna

## Estatísticas descritivas (algumas, não todas as possíveis!)

## Média
apply(women, 2, mean)
## Mediana
apply(women, 2, median)
## Variância
apply(women, 2, var)
## Quartis
apply(women, 2, quantile)
## Coeficiente de variação
apply(women, 2, function(x) sd(x)/mean(x))

## Tabelas de frequência

## Classes de height
h.range <- range(women$height) # miinimo e maximo
h.class <- nclass.Sturges(women$height) # numero de classes
h.cut <- cut(women$height,
             breaks = seq(h.range[1], h.range[2],
                          length.out = h.class + 1),
             include.lowest = TRUE)
# Distribuição de frequência
table(h.cut)

## Classes de weight
w.range <- range(women$weight) # miinimo e maximo
w.class <- nclass.Sturges(women$weight) # numero de classes
w.cut <- cut(women$weight,
             breaks = seq(w.range[1], w.range[2],
                          length.out = w.class + 1),
             include.lowest = TRUE)
# Distribuição de frequência
table(w.cut)

## Tabela de contingência entra as frequências de height e weight, com
## totais marginais
addmargins(table(h.cut, w.cut))

## Tabela de frequência relativa
prop.table(table(h.cut, w.cut))

## Dispersão e correlação

## Gráfico de dispersão entre height e weight
plot(weight ~ height, data = women)

## Correlação entre height e weight
cor(women$height, women$weight)

##----------------------------------------------------------------------
## ---- ex3
data(USArrests)
str(USArrests)

## 1. Qual o número médio e mediano de cada um dos crimes?
crimes <- c("Murder", "Assault", "Rape")
apply(USArrests[, crimes], 2,
      function(x) c(Media = mean(x), Mediana = median(x)))

## 2. Encontre a mediana e quartis para cada crime.
apply(USArrests[, crimes], 2, quantile)

## 3. Encontre o número máximo e mínimo para cada crime.
apply(USArrests[, crimes], 2, range)
apply(USArrests[, crimes], 2,
      function(x) c(Min = min(x), Max = max(x))

## 4. Faça um gráfico adequado para o número de assassinatos
## (`Murder`).
hist(USArrests$Murder)

## 5. Faça um *boxplot* para o número de estupros (`Rape`).
boxplot(USArrests$Rape)

## 6. Verifique se há correlação entre os diferentes tipos de crime.
plot(USArrests[, crimes])
cor(USArrests[, crimes])

## 7. Verifique se há correlação entre os crimes e a proporção de
## população urbana.
plot(USArrests)
cor(USArrests)

## 8. Encontre os estados com maior e menor ocorrência de cada tipo de
## crime.
# Murder
row.names(USArrests)[which.min(USArrests$Murder)]
row.names(USArrests)[which.max(USArrests$Murder)]
# Assault
row.names(USArrests)[which.min(USArrests$Assault)]
row.names(USArrests)[which.max(USArrests$Assault)]
# Rape
row.names(USArrests)[which.min(USArrests$Rape)]
row.names(USArrests)[which.max(USArrests$Rape)]

## 9. Encontre os estados com maior e menor ocorrência per capta de cada
## tipo de crime.
# Os crimes estao em numeros por 100.000 habitantes. Para calcular o
# numero de crimes per capta (por habitante), basta dividir cada coluna
# por 100.000, e multiplicar pela porporcao de populacao urbana
USArrests <- transform(USArrests, Murder2 = Murder/100000 * UrbanPop,
                       Assault2 = Assault/100000 * UrbanPop,
                       Rape2 = Rape/100000 * UrbanPop)
# Murder per capta
row.names(USArrests)[which.min(USArrests$Murder2)]
row.names(USArrests)[which.max(USArrests$Murder2)]
# Assault per capta
row.names(USArrests)[which.min(USArrests$Assault2)]
row.names(USArrests)[which.max(USArrests$Assault2)]
# Rape per capta
row.names(USArrests)[which.min(USArrests$Rape2)]
row.names(USArrests)[which.max(USArrests$Rape2)]

## 10. Encontre os estados com maior e menor ocorrência do total de crimes.
# Cria uma coluna com o total de crimes
USArrests <- transform(USArrests, Total = Murder + Assault + Rape)
row.names(USArrests)[which.min(USArrests$Total)]
row.names(USArrests)[which.max(USArrests$Total)]

## 11. Calcule a média de crimes (entre `Murder`, `Assault` e `Rape`)
## para cada estado.
apply(USArrests[, crimes], 1, mean)
