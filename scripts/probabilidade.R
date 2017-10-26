##======================================================================
## Distribuições de probabilidade no R
##======================================================================

## O R inclui funcionalidade para operações com distribuições de
## probabilidades. Para cada distribuição há 4 operações básicas indicadas
## pelas letras:

## - `d` calcula a densidade de probabilidade $f(x)$ no ponto $x$
## - `p` calcula a função de probabilidade acumulada $F(x)$ no ponto $x$
## - `q` calcula o quantil correspondente a uma dada probabilidade
## - `r` retira uma amostra aleatória da distribuição

## Para usar os funções deve-se combinar uma das letras acima com uma
## abreviatura do nome da distribuição. Por exemplo, para calcular
## probabilidades usamos: `pnorm()` para normal, `pexp()` para exponencial,
## `pbinom()` para binomial, `ppois()` para Poisson e assim por diante.

##======================================================================
## Distribuição Normal
##======================================================================

## dnorm() calcula a densidade no ponto x
## pnorm() calcula a probabilidade acumulada até o ponto x
## qnorm() calcula o quantil correspondente a uma dada probabilidade
## rnorm() gera amsotras aleatórias da Normal

## Veja ?dnorm
?dnorm
## Por padrão as funções assumem N(0,1). Inicialmente então vamos fazer
## um gráfico da densidade de uma N(0,1)
plot.function(dnorm, from = -4, to = 4)

## Primeiras constatações:
pnorm(0)
qnorm(0.5)

## Densidade no ponto x = -1
dnorm(-1)
## Probabilidade de X ser menor ou igual a -1, P[X <= -1]
pnorm(-1)
## Quantil referente à 0.975 de probabilidade
qnorm(0.975)
## Obtém 10 valores aleatórios da N(0,1)
rnorm(10)

## Repare que dnorm(-1) é o mesmo que se fizessemos o cálculo manual
## usando a densidade da Normal no ponto x = -1:
mu <- 0
sigma <- 1
x <- -1
(1/(sigma * sqrt(2*pi))) * exp((-1/2) * ((x - mu)/sigma)^2)
dnorm(-1)
## Para calcular P[X <= -1] usamos
pnorm(-1)
## Para calcular P[X > 1] podemos usar o complementar
1 - pnorm(-1)
## Ou usar o argumento lower.tail = FALSE
pnorm(-1, lower.tail = FALSE)
## Que é a maneira preferível por ser um cálculo mais preciso.
## O comando
qnorm(0.975)
## Calcula o valor de b, tal que P[X <= b] = 0.975. Similarmente,
## poderiamos obter esse valor fazendo P[X > b] = 0.025, e nesse caso
## usariamos novamente o argumento lower.tail
qnorm(0.025, lower.tail = FALSE)
## Se, ao contrário, quisermos o valor de a, tal que P[X <= a] = 0.025,
## podemos usar
qnorm(0.025)
## Ou P[X > a] = 0.975
qnorm(0.975, lower.tail = FALSE)

## Seja $X$ uma VA com distribuição $N(100, 100)$. Calcular as
## probabilidades:
## - P[X < 95]
## - P[90 < X < 110]
## - P[X > 95]
pnorm(95, mean = 100, sd = 10)
pnorm(110, mean = 100, sd = 10) - pnorm(90, mean = 100, sd = 90)
1 - pnorm(95, mean = 100, sd = 10)
pnorm(95, mean = 100, sd = 10)

## Para ilustração, podemos fazer um gráfico com diferentes densidades
## da Normal
plot(function(x) dnorm(x, 100, 8), 60, 140, ylab = 'f(x)')
plot(function(x) dnorm(x, 90, 8), 60, 140, add = TRUE, col = 2)
plot(function(x) dnorm(x, 100, 15), 60, 140, add = TRUE, col = 3)
legend(120, 0.05, fill = 1:3,
       legend = c("N(100,64)", "N(90,64)", "N(100,225)"))

##======================================================================
## Distribuição Binomial
##======================================================================

## dbinom() calcula a densidade no ponto x
## pbinom() calcula a probabilidade acumulada até o ponto x
## qbinom() calcula o quantil correspondente a uma dada probabilidade
## rbinom() gera amsotras aleatórias

## Veja ?dbinom
?dbinom
args(dbinom)
## A distribuição binomial tem parâmetros n e p, representados aqui
## pelos argumentos size e prob, respectivamente.
## Considere uma Bin(n=10, p=0.35)
x <- 0:10
fx <- dbinom(x, size = 10, prob = 0.35)
plot(x, fx, type = "h")
## Faça o que se pede:
## Calcular P[X = 7]
## Calcular P[X <= 7]
## Calcular P[X > 7]
## Calcular P[3 < X <= 6]

## P[X = 7]
dbinom(7, 10, 0.35)
## Veja que usamos a dbinom, e não a pbinom para calcular a
## probabilidade. Isso porque a pbinom calcula as probabilidades
## ACUMULADAS até o ponto x. Portanto
pbinom(7, 10, 0.35)
## é a P[X <= 7]. Como a distribuição é discreta, então é o mesmo que
sum(dbinom(0:7, 10, 0.35))
## P[X > 7] = 1 - P[X <= 7]
1 - pbinom(7, 10, 0.35)
## Sempre é melhor usar lower.tail
pbinom(7, 10, 0.35, lower.tail = FALSE)
## P[3 < X <= 6] = P[X = 4] + P[X = 5] + P[X = 6]
sum(dbinom(4:6, 10, 0.35))
## Ou P[3 < X <= 6] = P[X <= 6] - P[X <= 3]
pbinom(6, 10, 0.35) - pbinom(3, 10, 0.35)

## Quantis e números aleatórios são obtidos da mesma forma
## Encontre a tal que P[X <= a] = 0.5
qbinom(0.5, 10, 0.35)
## Dez números aleatórios
rbinom(10, 10, 0.35)

## Veja que a dbinom() acima poderia ter sido calculada pela função de
## probabilidade da binomial
n <- 10
p <- 0.35
x <- 7
factorial(n)/(factorial(x)*factorial(n - x)) * p^x * (1-p)^(n-x)
## Usando choose() para calcular o coeficiente binomial
choose(n, x) * p^x * (1-p)^(n-x)
dbinom(7, 10, 0.35)

##======================================================================
## Distribuição de Poisson
##======================================================================

## dpois() calcula a densidade no ponto x
## ppois() calcula a probabilidade acumulada até o ponto x
## qpois() calcula o quantil correspondente a uma dada probabilidade
## rpois() gera amsotras aleatórias

## Veja ?dpois
?dpois
args(dpois)
## Veja que a Poisson só possui um parâmetro (lambda), que é a taxa de
## ocorrência do evento em UMA unidade de tempo. Aqui o argumento lambda
## pode ser usado também quando se usa mu = lambda . t

## Considere Pois(lambda = 2)
x <- 0:20
fx <- dpois(x, lambda = 2)
plot(x, fx, type = "h")
## Faça o que se pede:
## Calcular P[X = 0]
## Calcular P[X = 2]
## Calcular P[X >= 2]
## Calcular P[5 <= X <= 10]

## P[X = 0]
dpois(0, 2)
ppois(0, 2)
## P[X = 2]
dpois(2, 2)
## P[X >= 2] = 1 - P[X < 2]
1 - ppois(1, 2)
ppois(1, 2, lower.tail = FALSE)
## P[5 <= X <= 10] = P[X = 5] + ... + P[X = 10]
sum(dpois(5:10, 2))
## Ou P[5 <= X <= 10] = P[X <= 10] - P[X < 5]
ppois(10, 2) - ppois(4, 2)

## Quantis e números aleatórios são obtidos da mesma forma
## Encontre a tal que P[X <= a] = 0.5
qpois(0.5, 2)
## Dez números aleatórios
rpois(10, 2)

## Veja que a dpois() acima poderia ter sido calculada pela função de
## probabilidade da Poisson
lambda <- 2
x <- 2
(exp(-lambda)*lambda^x)/factorial(x)
dpois(2, 2)
