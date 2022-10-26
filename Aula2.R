# Universidade Estadual da Paraíba - UEPB
# Centro de Ciências e Tecnologia - CCT
# Curso de Estatística
# Disciplina: Séries Temporais
# Professor: Pedro Almeida
# Aluna: Hillnara de Paiva


#                   Atividade 2

library(TSA)
library(forecast)
library(astsa)


#Plotar o grafico
tsplot(soi)

# decompor, quebrar a serie para o modelo, tendência, sazonalidade, resíduo 
St_decompose=decompose(soi)

#Nomes da decomposição
names(St_decompose)

#Números da tendências
Tend=(St_decompose$trend)


#Gráfico da série completa
plot(St_decompose)
plot

#Autocorrelação
par(mfrow = c(1,2))
acf(soi)
pacf(soi)

# Suavizaçõa
library(zoo) # pacote
set.seed(1964) # travar a semente
x=runif(10,0,10) # gerar numeros aleatorios

plot.ts(x) #plotar o graficos
M=rollmean(x,k=2) #rodando media movel
M

lines(M,col='red') 

