# Aula 5 - Machine Learning - Min(perda) evitando sobreajuste
m <- mtcars


# Preparação das amostras de treino e teste aleatórias
set.seed(33)
va<-sample(32)
# Separação das bases de treino e teste
treino <- m[va[1:24],]
teste <- m[va[25:32],]
# Modelagem estatística (treinamento)
# mod <- lm(mpg~wt, data=treino)
mod <- lm(mpg~log(wt), data=treino)
# Análise do modelo
summary(mod)
# Previsão em teste
p <- predict(mod, newdata=teste)
# Cálculo do erro de previsão
#(neste caso utilizaremos sse - sum of squared errors)
sse <- sum((p-teste$mpg)^2)



# Transformação log em variável com cresc exponencial
# ANTES DA TRANSF
# Gráfico dispersão
plot(m$mpg~m$wt)
# Coef. correlação linear
cor(m$mpg, m$wt)



# DEPOIS DA TRANSF
# Gráfico dispersão
plot(m$mpg~log(m$wt))
# Coef. correlação linear
cor(m$mpg, log(m$wt))


#TEORIA DE PROBABILIDADES
dt <- read.csv("https://raw.githubusercontent.com/diogenesjusto/FIAP/master/dados/train_titanic.csv")

#quantidade de passageiros sobreviventes e mortos
table(dt$Survived)
#calc de prop
prop.table(table(dt$Survived))

#quantidade do genero
table(dt$Sex)
#calc de prop
prop.table(table(dt$Sex))

#Emular SQL no R
install.packages("sqldf")
library(sqldf)
sqldf("select Survived, count(*) from dt group by Survived")


#calc de arvores de (probabilidade) de decisão no R
install.packages("party")
library(party)

#as.factor transformação de uma variavel em categorica
mod <- ctree(Survived~as.factor(Sex)+Pclass, data=dt)

plot(mod, type="simple")
