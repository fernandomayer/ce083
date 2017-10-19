##======================================================================
## Exercícios - Análise Exploratória de dados
##======================================================================

##======================================================================
##
## Dados disponíveis em:
## http://leg.ufpr.br/~fernandomayer/data/dados_aluguel.csv
##
## Descrição dos dados:
##
## Os dados desta planilha se referem a um levantamento de preços de
## aluguel de apartamentos e casas na cidade de Munique (Alemanha). As
## variáveis são:
##
## aluguel: o valor do aluguel
## metragem: tamanho em metros quadrados
## ano: ano de construção do local
## aquecimento: indicação se existe ou não aquecimento no local
## loc: classificação do imóvel quanto à faixa de renda do bairro
##
##======================================================================

##======================================================================
## Início das questões
##======================================================================

##======================================================================
## Importação e conferência dos dados

## Importe os dados gerados
url <- "http://leg.ufpr.br/~fernandomayer/data/dados_aluguel.csv"
dados <- read.csv2(url)

## Verifique a estrutura dos dados importados
str(dados)

## Faça um sumário estatístico do objeto de dados
summary(dados)

## Classifique todas as variáveis do conjunto de dados
## Escreva aqui em forma de comentário, uma linha para cada variável
## Exemplo:
## var1: qualitativa ordinal
# aluguel: quantitativa contínua
# metragem: quantitativa discreta
# ano: quantitativa discreta
# aquecimento: quantitativa discreta
# loc: qualitativa ordinal

##======================================================================
## Variável ano

## Mostre quantos anos existem na amostra
length(unique(dados$ano))

## Frequência absoluta
table(dados$ano)

## Frequência relativa
prop.table(table(dados$ano))

## Gráfico de barras
barplot(table(dados$ano))

## Qual o ano com maior número de observações na amostra?
## Dica: use as funções table() e which.max()
table(dados$ano)[which.max(table(dados$ano))]

##======================================================================
## Variável aquecimento

## Frequência absoluta
table(dados$aquecimento)

## Frequência relativa com a soma marginal
addmargins(prop.table(table(dados$aquecimento)))

## Gráfico de barras com as frequências relativas
barplot(prop.table(table(dados$aquecimento)))

##======================================================================
## Variável loc

## Frequência absoluta com a soma marginal
addmargins(table(dados$loc))

## Frequência relativa com a soma marginal
addmargins(prop.table(table(dados$loc)))

## Gráfico de barras com as frequências relativas, colocando as barras
## na ordem: Alta, Média, Baixa
dados$loc <- factor(dados$loc, levels = c("Alta", "Média", "Baixa"))
barplot(prop.table(table(dados$loc)))

##======================================================================
## Cruzamento entre as variáveis loc e aquecimento
## Faça as tabelas com as variáveis nessa ordem: loc e aquecimento

## Frequência absoluta
with(dados, table(loc,aquecimento))

## Frequência relativa
with(dados, prop.table(table(loc,aquecimento)))

## Adicione as margens da tabela de frequência relativa (somas de linhas
## e colunas)
with(dados, addmargins(prop.table(table(loc,aquecimento))))

## Gráfico de barras da frequência absoluta desse cruzamento, com as
## barras lado-a-lado
with(dados, barplot(table(loc, aquecimento), beside = TRUE))

##======================================================================
## Variável aluguel

## Máximo e mínimo
range(dados$aluguel)

## Fazendo uma tabela de frequência:
# 1) Número de classes estimado, com base no critério de Sturges
# Dica: ?nclass.Sturges
nclass.Sturges(dados$aluguel)

# 2) Com base no número de classes definido acima, crie as classes com a
# função cut(), e armazene em um objeto chamado "classes".
# As classes obrigatoriamente devem ser entre o valor mínimo e o máximo
# da variável nota (não podem ser criadas classes com valores inferiores
# ao mínimo ou superiores ao máximo), e devem ser *exatamente* o número
# de classes retornado acima
classes <- cut(dados$aluguel, breaks = seq(102, 3000, length = 13),
               include.lowest = TRUE)

# 3) Tabela com as frequências absolutas por classe
table(classes)

# 4) Tabela com as frequências relativas por classe, adicionando a soma
# marginal
addmargins(prop.table(table(classes)))

## Faça um histograma
hist(dados$aluguel)

## Faça um histograma com as mesmas classes que você criou acima na
## função cut()
hist(dados$aluguel, breaks = seq(102, 3000, length = 13))

## Boxplot
boxplot(dados$aluguel)

## Mediana
median(dados$aluguel)

## Média
mean(dados$aluguel)

## Quartis
quantile(dados$aluguel)

## Amplitude
diff(range(dados$aluguel))

## Variância
var(dados$aluguel)

## Desvio-padrão
sd(dados$aluguel)

## Coeficiente de variação
sd(dados$aluguel)/mean(dados$aluguel)

##======================================================================
## Cruzamento entra as variáveis aluguel e loc
## Faça as tabelas com as variáveis nessa ordem: aluguel e loc

## Com o objeto "classes" criado acima, que define as classes para a
## variável aluguel, obtenha uma tabela de frequência relativa entre
## as localizações e as classes de aluguel. As frequências devem ser
## calculadas relativas ao total das linhas. Acrescente também os totais
## marginais dessa tabela.
with(dados, addmargins(prop.table(table(classes, loc)), margin = 1))

## Calcule a média de aluguel para cada loc
with(dados, tapply(aluguel, loc, mean))

## Faça um boxplot de aluguel para cada loc (em um mesmo gráfico)
boxplot(aluguel ~ loc, data = dados)

## Faça um boxplot de aluguel para cada loc, separado por aquecimento
## (ou seja, para cada categoria de aquecimento, faça um boxplot de
## aluguel para cada loc). Os gráficos devem ficar na mesma janela
## gráfica, e os limites dos eixos Y dos dois gráficos devem ser os
## mesmos.
par(mfrow = c(1, 2))
boxplot(aluguel ~ loc, data = dados, subset = aquecimento == 0,
        ylim = c(0, 3000), main = "Com aquecimento")
boxplot(aluguel ~ loc, data = dados, subset = aquecimento == 1,
        ylim = c(0, 3000), main = "Sem aquecimento")
par(mfrow = c(1, 1))
## OU usando o pacote lattice
library(lattice)
bwplot(aluguel ~ loc | factor(aquecimento), data = dados)

##======================================================================
## Relação entre aluguel e metragem

## Faça um gráfico de dispersão entre aluguel e metragem
plot(aluguel ~ metragem, data = dados)

## Usando a função cut(), crie um objeto com classes para agrupar a
## variável metragem. Use apenas 5 classes.
range(dados$metragem)
classes.met <- cut(dados$metragem, breaks = seq(30, 120, length = 6),
                   include.lowest = TRUE)

## Faça a tabela de frequência absoluta com essas classes
table(classes.met)

## Calcule a média de aluguel para cada classe de metragem
with(dados, tapply(aluguel, classes.met, mean))

## Calcule o coeficiente de variação de aluguel para cada classe de
## metragem
cv <- function(x){
    sd(x)/mean(x)
}
with(dados, tapply(aluguel, classes.met, cv))

##======================================================================
## Média de aluguel por ano

## Crie um novo objeto (data.frame) duas colunas: ano e média de alugual
## para cada ano
med.ano <- aggregate(aluguel ~ ano, data = dados, mean)

## Faça um gráfico de dispersão com a média de aluguel para cada ano
plot(aluguel ~ ano, data = med.ano)

## Exporte esse novo objeto para um arquivo csv, com separador de
## decimal sendo ponto e separador de coluna sendo vírgula, e sem nomes
## de linhas
write.table(med.ano, "medias_ano.csv", sep = ",", dec = ".",
            row.names = FALSE, col.names = TRUE)
