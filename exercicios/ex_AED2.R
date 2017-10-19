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
## aquecimento: indicação se existe ou não aquecimento no local (0 = COM
## aquecimento; 1 = SEM aquecimento)
## loc: classificação do imóvel quanto à faixa de renda do bairro
##
##======================================================================

##======================================================================
## Início das questões
##======================================================================

##======================================================================
## Importação e conferência dos dados

## Importe os dados


## Verifique a estrutura dos dados importados


## Faça um sumário estatístico do objeto de dados


## Classifique todas as variáveis do conjunto de dados
## Escreva aqui em forma de comentário, uma linha para cada variável
## Exemplo:
## var1: qualitativa ordinal

##======================================================================
## Variável ano

## Mostre quantos anos existem na amostra


## Frequência absoluta


## Frequência relativa


## Gráfico de barras


## Qual o ano com maior número de observações na amostra?
## Dica: use as funções table() e which.max()


##======================================================================
## Variável aquecimento

## Frequência absoluta


## Frequência relativa com a soma marginal


## Gráfico de barras com as frequências relativas


##======================================================================
## Variável loc

## Frequência absoluta com a soma marginal


## Frequência relativa com a soma marginal


## Gráfico de barras com as frequências relativas, colocando as barras
## na ordem: Alta, Média, Baixa


##======================================================================
## Cruzamento entre as variáveis loc e aquecimento
## Faça as tabelas com as variáveis nessa ordem: loc e aquecimento

## Frequência absoluta


## Frequência relativa


## Adicione as margens da tabela de frequência relativa (somas de linhas
## e colunas)


## Gráfico de barras da frequência absoluta desse cruzamento, com as
## barras lado-a-lado


##======================================================================
## Variável aluguel

## Máximo e mínimo


## Fazendo uma tabela de frequência:
# 1) Número de classes estimado, com base no critério de Sturges
# Dica: ?nclass.Sturges


# 2) Com base no número de classes definido acima, crie as classes com a
# função cut(), e armazene em um objeto chamado "classes".
# As classes obrigatoriamente devem ser entre o valor mínimo e o máximo
# da variável nota (não podem ser criadas classes com valores inferiores
# ao mínimo ou superiores ao máximo), e devem ser *exatamente* o número
# de classes retornado acima


# 3) Tabela com as frequências absolutas por classe


# 4) Tabela com as frequências relativas por classe, adicionando a soma
# marginal


## Faça um histograma


## Faça um histograma com as mesmas classes que você criou acima na
## função cut()


## Boxplot


## Mediana


## Média


## Quartis


## Amplitude


## Variância


## Desvio-padrão


## Coeficiente de variação


##======================================================================
## Cruzamento entra as variáveis aluguel e loc
## Faça as tabelas com as variáveis nessa ordem: aluguel e loc

## Com o objeto "classes" criado acima, que define as classes para a
## variável aluguel, obtenha uma tabela de frequência relativa entre
## as localizações e as classes de aluguel. As frequências devem ser
## calculadas relativas ao total das linhas. Acrescente também os totais
## marginais dessa tabela.


## Calcule a média de aluguel para cada loc


## Faça um boxplot de aluguel para cada loc (em um mesmo gráfico)


## Faça um boxplot de aluguel para cada loc, separado por aquecimento
## (ou seja, para cada categoria de aquecimento, faça um boxplot de
## aluguel para cada loc). Os gráficos devem ficar na mesma janela
## gráfica, e os limites dos eixos Y dos dois gráficos devem ser os
## mesmos.



##======================================================================
## Relação entre aluguel e metragem

## Faça um gráfico de dispersão entre aluguel e metragem

## Usando a função cut(), crie um objeto com classes para agrupar a
## variável metragem. Use apenas 5 classes.


## Faça a tabela de frequência absoluta com essas classes


## Calcule a média de aluguel para cada classe de metragem


## Calcule o coeficiente de variação de aluguel para cada classe de
## metragem


##======================================================================
## Média de aluguel por ano

## Crie um novo objeto (data.frame) duas colunas: ano e média de alugual
## para cada ano


## Faça um gráfico de dispersão com a média de aluguel para cada ano


## Exporte esse novo objeto para um arquivo csv, com separador de
## decimal sendo ponto e separador de coluna sendo vírgula, e sem nomes
## de linhas
