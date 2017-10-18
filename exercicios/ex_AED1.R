##======================================================================
## Exercícios - Análise Exploratória de Dados
##======================================================================

##======================================================================
## Importação e conferência dos dados
## Baixar os dados em:
## http://leg.ufpr.br/~fernandomayer/data/aval_carros_nota.txt

## Importe os dados gerados


## Verifique a estrutura dos dados importados


## Faça um sumário estatístico do objeto de dados


## Classifique todas as variáveis do conjunto de dados
## Escreva aqui em forma de comentário, uma linha para cada variável
## Exemplo:
## var1: qualitativa ordinal


##======================================================================
## Variável carro

## Frequência absoluta


## Frequência relativa


## Gráfico de barras


## Qual o carro que ocorre com maior frequência? Crie um comando para
## retornar apenas o nome do carro, ou seja, calcule a moda.
## Dica: use as funções table() e which.max()


##======================================================================
## Variável item

## Frequência absoluta


## Frequência relativa


## Gráfico de barras


##======================================================================
## Cruzamento entre as variáveis item e carro
## Faça as tabelas com as variáveis nessa ordem: item e carro

## Frequência absoluta


## Frequência relativa


## Adicione as margens da tabela de frequência absoluta (somas de linhas
## e colunas)


## Frequência relativa em relação ao total de carros


## Gráfico de barras da frequência absoluta, com as barras empilhadas


##======================================================================
## Variável nota

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


# 4) Tabela com as frequências relativas por classe


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
## Cruzamento entra as variáveis nota e carro
## Faça as tabelas com as variáveis nessa ordem: nota e carro

## Com o objeto "classes" criado acima, que define as classes para a
## variável nota, obtenha uma tabela de frequência relativa entre as
## marcas de carro e as classes de nota. As frequências devem ser
## calculadas relativas ao total das linhas, ou seja das classes de
## notas. Acrescente também os totais marginais dessa tabela.


## Calcule a média de nota para cada marca de carro


## Faça um boxplot das notas para cada carro (em um mesmo gráfico)


##======================================================================
## Crie uma nova variável no seu objeto de dados com o seguinte cálculo
## 10 + nota * 5 + rnorm(length(dados$nota), 0, 10)


## Faça um gráfico de dispersão entre a variável nota e esta nova
## variável que você criou acima


## Calcule o coeficiente de correlação de Pearson entre estas duas
## variáveis
