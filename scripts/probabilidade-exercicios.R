##======================================================================
## Resolução dos exercícios da página probabilidade.html
##======================================================================

##----------------------------------------------------------------------
## ----- ex1
## a. Mostre que $f(x)$ é uma f.d.p.
fex1 <- function(x){
    fx <- numeric(length(x))
    fx[x < 0] <- 0
    fx[x >= 0 & x <= 2] <- (1/10) * x[x >= 0 & x <= 2] + (1/10)
    fx[x > 2 & x <= 6] <- (-3/40) * x[x > 2 & x <= 6] + (9/20)
    fx[x > 6] <- 0
    return(fx)
}
plot(fex1, -1, 7)
integrate(fex1, 0, 6)
## b. Qual a renda média nesta localidade?
## Cria uma função para a esperança
efex1 <- function(x) { x * fex1(x) }
integrate(efex1, 0, 6)
## c. Calcule a probabilidade de encontrar uma pessoa com renda acima
## de 4,5 u.m. e indique o resultado no gráfico da distribuição.
int <- integrate(fex1, 4.5, 6)
int
## Um exemplo de gráfico mais elaborado
plot(fex1, -1, 7, xlab = "x", ylab = "f(x)")
abline(h = 0, col = "darkgray", lty = 2)
abline(v = 0, col = "darkgray", lty = 2)
polygon(x = c(4.5, 4.5, 6), y = c(0, fex1(4.5), 0),
        dens = -1, col = "lightgray")
arrows(x0 = 4.5, y0 = fex1(4.5), x1 = 4.5, y1 = 0, col = 2)
arrows(x0 = 4.5, y0 = fex1(4.5), x1 = 0, y1 = fex1(4.5), col = 2)
text(x = 4.5, y = 0, labels = 4.5, pos = 1, offset = 0.25, col = 2)
text(x = 0, y = fex1(4.5), labels = fex1(4.5), pos = 2,
     offset = 0.25, col = 2)
text(x = 5, y = 0.03, labels = round(int$value, 3))
