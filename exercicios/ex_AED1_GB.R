##======================================================================
## Exercícios - Análise Exploratória de Dados
##======================================================================

##======================================================================
## Importação e conferência dos dados
## Baixar os dados em:
## http://leg.ufpr.br/~fernandomayer/data/aval_carros_nota.txt

## Importe os dados gerados
url <- "http://www.leg.ufpr.br/~fernandomayer/data/aval_carros_nota.txt"
dados <- read.table(url, header = TRUE, sep = "\t")

## Verifique a estrutura dos dados importados
str(dados)

## Faça um sumário estatístico do objeto de dados
summary(dados)

## Classifique todas as variáveis do conjunto de dados
## Escreva aqui em forma de comentário, uma linha para cada variável
## Exemplo:
## var1: qualitativa ordinal
# carro: qualitativa nominal
# dono: quantitativa discreta
# item: qualitativa nominal
# nota: quantitativa contínua

##======================================================================
## Variável carro

## Frequência absoluta
table(dados$carro)

## Frequência relativa
prop.table(table(dados$carro))

## Gráfico de barras
barplot(table(dados$carro))

## Qual o carro que ocorre com maior frequência? Crie um comando para
## retornar apenas o nome do carro, ou seja, calcule a moda.
## Dica: use as funções table() e which.max()
names(table(dados$carro))[which.max(table(dados$carro))]


##======================================================================
## Variável item

## Frequência absoluta
table(dados$item)

## Frequência relativa
prop.table(table(dados$item))

## Gráfico de barras
barplot(table(dados$item))

##======================================================================
## Cruzamento entre as variáveis item e carro
## Faça as tabelas com as variáveis nessa ordem: item e carro

## Frequência absoluta
table(dados$item, dados$carro)

## Frequência relativa
prop.table(table(dados$item, dados$carro))

## Adicione as margens da tabela de frequência absoluta (somas de linhas
## e colunas)
addmargins(prop.table(table(dados$item, dados$carro)))

## Frequência relativa em relação ao total de carros
prop.table(table(dados$item, dados$carro), margin = 2)

## Gráfico de barras da frequência absoluta, com as barras empilhadas
barplot(table(dados$item, dados$carro), legend = TRUE, beside = FALSE)

##======================================================================
## Variável nota

## Máximo e mínimo
range(dados$nota, na.rm = TRUE)

## Fazendo uma tabela de frequência:
# 1) Número de classes estimado, com base no critério de Sturges
# Dica: ?nclass.Sturges
nclass.Sturges(dados$nota)

# 2) Com base no número de classes definido acima, crie as classes com a
# função cut(), e armazene em um objeto chamado "classes".
# As classes obrigatoriamente devem ser entre o valor mínimo e o máximo
# da variável nota (não podem ser criadas classes com valores inferiores
# ao mínimo ou superiores ao máximo), e devem ser *exatamente* o número
# de classes retornado acima
classes <- cut(dados$nota, breaks = seq(0, 10, length = 14),
               include.lowest = TRUE)

# 3) Tabela com as frequências absolutas por classe
table(classes)

# 4) Tabela com as frequências relativas por classe
prop.table(table(classes))

## Faça um histograma
hist(dados$nota)

## Faça um histograma com as mesmas classes que você criou acima na
## função cut()
hist(dados$nota, breaks = seq(0, 10, length = 14))

## Boxplot
boxplot(dados$nota)

## Mediana
median(dados$nota, na.rm = TRUE)

## Média
mean(dados$nota, na.rm = TRUE)

## Quartis
quantile(dados$nota, na.rm = TRUE)

## Amplitude
diff(range(dados$nota, na.rm = TRUE))

## Variância
var(dados$nota, na.rm = TRUE)

## Desvio-padrão
sd(dados$nota, na.rm = TRUE)

## Coeficiente de variação
sd(dados$nota, na.rm = TRUE)/length(dados$nota)

##======================================================================
## Cruzamento entra as variáveis nota e carro
## Faça as tabelas com as variáveis nessa ordem: nota e carro

## Com o objeto "classes" criado acima, que define as classes para a
## variável nota, obtenha uma tabela de frequência relativa entre as
## marcas de carro e as classes de nota. As frequências devem ser
## calculadas relativas ao total das linhas, ou seja das classes de
## notas. Acrescente também os totais marginais dessa tabela.
addmargins(prop.table(table(classes, dados$carro), margin = 1))

## Calcule a média de nota para cada marca de carro
tapply(dados$nota, dados$carro, mean, na.rm = TRUE)

## Faça um boxplot das notas para cada carro (em um mesmo gráfico)
boxplot(nota ~ carro, data = dados)

##======================================================================
## Crie uma nova variável no seu objeto de dados com o seguinte cálculo
## 10 + nota * 5 + rnorm(length(dados$nota), 0, 10)
dados$nota2 <- 10 + dados$nota * 5 + rnorm(length(dados$nota), 0, 10)

## Faça um gráfico de dispersão entre a variável nota e esta nova
## variável que você criou acima
plot(nota2 ~ nota, data = dados)

## Calcule o coeficiente de correlação de Pearson entre estas duas
## variáveis
cor(dados$nota[!is.na(dados$nota)], dados$nota2[!is.na(dados$nota2)])
