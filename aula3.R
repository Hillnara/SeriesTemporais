# Pacotes
library(TSA)
library(forecast)
library(fpp3)


br_economy<-global_economy %>%
  filter(Country == "Brazil")

br_economy %>%
  autoplot(Exports) +
  labs(y="% of GDP", title = "Exports:Brasil")
br_economy

# Usnado a função ses
SES=ses(br_economy$Exports,h=3) # Fazendo uma previsão 3 (dias ou meses ou anos)
autoplot(SES)

# Usando a função ETS para modelo de suavização
fit<-br_economy %>%
  model(ETS(Exports ~ error("A") + trend("N") + season("N")))
fit

#

fc<-forecast(fit, h=3)

fc %>%
  autoplot(br_economy)+
  geom_line(aes(y=.fitted),col="#D55E00",
            data=augment(fit))+
  labs(y="% of GDP",title = "Exports: Brasil")+
  guides(colour="none")
