##======================================================================
## Estatística Computacional I
## Curso de Estatística - 2017/2
## Prof. Fernando Mayer                                LEG - DEST - UFPR
##======================================================================

##======================================================================
##
## Nome:                                    GRR:
## Nome:                                    GRR:
##
##======================================================================

##======================================================================
## Segunda prova - 07/11/2017
##
## Instruções:
##
## - responda com os comandos necessários para executar o que se pede
## - digite os comandos na linha logo abaixo da pergunta
## - não insira mais linhas em branco entre uma pergunta e outra
## - linhas separadas por "===" são seções e indicam a variável que deve
##   ser considerada. Todos as perguntas dentro de uma seção se referem
##   apenas àquela variável mencionada
##
##======================================================================

##======================================================================
##
## Descrição dos dados:
##
## Os dados desta planilha se referem as capturas de duas espécies de
## atum: albacora-lage (LAGE) e albacora-branca (BRANCA), por barcos de
## espinhel de superfície no Oceano Atlântico Sul. As variáveis são:
##
## FROTA: país ao qual pertence a frota pesqueira (BRA: Brasil; BRA-ESP:
## Brasil arrendado pela Espanha)
## ANO: ano da captura
## MES: mês da captura
## LAT: latitude da captura
## LON: longitude da captura
## EFF: esforço de pesca (número de anzóis)
## LAGE: captura (kg) de albacora-lage
## BRANCA: captura (kg) de albacora-branca
##
##======================================================================

##======================================================================
## Início das questões
##======================================================================

##======================================================================
## Importação e conferência dos dados

## Importe os dados
dados <- read.table("dados_atum.csv", header = TRUE,
                    sep = ";", dec = ",")

## Verifique a estrutura dos dados importados
str(dados)

## Faça um sumário estatístico do objeto de dados
summary(dados)

## Classifique todas as variáveis do conjunto de dados
## Escreva aqui em forma de comentário, uma linha para cada variável
## Exemplo:
## var1: qualitativa ordinal

## FROTA: qualitativa nominal
## ANO: quantitativa discreta
## MES: quantitativa discreta
## EFF: quantitativa discreta
## LAGE: quantitativa contínua
## BRANCA: quantitativa contínua

##======================================================================
## Variável ANO

## Mostre quantos anos existem na amostra
length(unique(dados$ANO))

## Frequência absoluta com soma marginal
addmargins(table(dados$ANO))

## Gráfico de barras com as frequências absolutas
barplot(table(dados$ANO))

##======================================================================
## Variável MES

## Frequência relativa com a soma marginal
addmargins(prop.table(table(dados$MES)))

## Gráfico de barras com as frequências relativas
barplot(prop.table(table(dados$MES)))

## Crie uma nova variável chamada TRIM, para representar os trimestres
## de cada ano, de acordo com o mês. Isto é:
## Se MES for igual a 1, 2, ou 3 o TRIM deve ser 1
## Se MES for igual a 4, 5, ou 6 o TRIM deve ser 2
## Se MES for igual a 7, 8, ou 9 o TRIM deve ser 3
## Se MES for igual a 10, 11, ou 12 o TRIM deve ser 4
dados$TRIM <- 1
dados$TRIM[dados$MES %in% c(4, 5, 6)] <- 2
dados$TRIM[dados$MES %in% c(7, 8, 9)] <- 3
dados$TRIM[dados$MES %in% c(10, 11, 12)] <- 4

## Faça duas tabelas de frequência (absoluta), uma para MES e outra para
## TRIM e confira o resultado
table(dados$TRIM)
table(dados$MES)

## Faça uma tabela de frequência entre MES e TRIM
with(dados, table(MES, TRIM))

##======================================================================
## Variável FROTA

## Frequência absoluta com a soma marginal
addmargins(table(dados$FROTA))

## Gráfico de barras com as frequências relativas
barplot(prop.table(table(dados$FROTA)))

##======================================================================
## Variáveis LAGE e BRANCA

## Faça um histograma para cada espécie, lado-a-lado, na mesma janela
## gráfica
par(mfrow = c(1, 2))
hist(dados$LAGE, main = "LAGE")
hist(dados$BRANCA, main = "BRANCA")
par(mfrow = c(1, 1))

## Através do histograma, percebe-se que a distribuição das duas
## espécies é extremamente assimétrica. Para tornar essas distribuições
## simétricas podemos transformar as variáveis usando o log. Crie duas
## novas colunas, LLAGE e LBRANCA, cada uma sendo o log da respectiva
## espécie.
dados$LLAGE <- log(dados$LAGE)
dados$LBRANCA <- log(dados$BRANCA)

## Faça novamente um histograma para cada espécie (na mesma janela,
## lado-a-lado) com essas novas variáveis (LLAGE e LBRANCA)
par(mfrow = c(1, 2))
hist(dados$LLAGE, main = "LAGE")
hist(dados$LBRANCA, main = "BRANCA")
par(mfrow = c(1, 1))

## Faça dois boxplots (na mesma janela, lado-a-lado), para LLAGE e
## LBRANCA, fixando a amplitude do eixo Y (deixando os dois gráficos na
## mesma escala para que fiquem comparáveis)
range(dados$LLAGE, na.rm = TRUE)
range(dados$LBRANCA, na.rm = TRUE)
par(mfrow = c(1, 2))
boxplot(dados$LLAGE, ylim = c(0, 14), main = "LAGE")
boxplot(dados$LBRANCA, ylim = c(0, 14), main = "BRANCA")
par(mfrow = c(1, 1))

## Calcule a média de LLAGE e LBRANCA para cada MES
aggregate(cbind(LLAGE, LBRANCA) ~ MES, data = dados, mean)

## Calcule a média de LLAGE e LBRANCA para cada MES e FROTA
aggregate(cbind(LLAGE, LBRANCA) ~ MES + FROTA, data = dados, mean)

##======================================================================
## Variável LBRANCA (log de BRANCA)

## Máximo e mínimo
range(dados$LBRANCA, na.rm = TRUE)

## Mediana
median(dados$LBRANCA, na.rm = TRUE)

## Média
mean(dados$LBRANCA, na.rm = TRUE)

## Desvio-padrão
sd(dados$LBRANCA, na.rm = TRUE)

## Amplitude
diff(range(dados$LBRANCA, na.rm = TRUE))

## Média de LBRANCA por FROTA
with(dados, tapply(LBRANCA, FROTA, mean, na.rm = TRUE))

## Média de LBRANCA por ANO e FROTA
with(dados, tapply(LBRANCA, list(ANO, FROTA), mean, na.rm = TRUE))

## Boxplot de LBRANCA por FROTA (um único gráfico)
boxplot(LBRANCA ~ FROTA, data = dados)

##======================================================================
## Média de LBRANCA por MES e FROTA

## Crie um novo objeto (data.frame) com três colunas: MES, FROTA, e
## média de LBRANCA para cada mês e frota
novo <- aggregate(LBRANCA ~ MES + FROTA, dados, mean)

## Faça dois gráficos de dispersão lado-a-lado (ne mesma janela) com a
## relação da média de LBRANCA para cada MES, onde cada um dos dois
## gráficos se refere a uma frota.
## Faça os gráficos com linha (veja o argumento 'type' de ?plot)
par(mfrow = c(1,2))
plot(LBRANCA ~ MES, novo, subset = FROTA == "BRA", type = "l")
plot(LBRANCA ~ MES, novo, subset = FROTA == "BRA-ESP", type = "l")
par(mfrow = c(1,1))
