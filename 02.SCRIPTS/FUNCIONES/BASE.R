#Maria Fernanda Bravo Garcia
setwd("~/Microtesis/Tesis1/02.SCRIPTS/FUNCIONES/") 
#Librerias 
library(seqtime)
library(ggplot2)
library(reshape2)
library(igraph)

#Matriz 
N = 10 
A = generateA(N,"klemm", pep = 34, c = 0.05)

setwd("~/Microtesis/Tesis1/03.OUTPUT/")
save(A, file = "MatrizA.RData")

##Ricker
#Revisar lo de K 
#Valores de sigma: 0.01  0.05  0.1  SI CAMBIA LA GRÁFICA
rickerplot=tsplot(ricker(N,A=A,K=rep(0.01,N), tend=15, sigma = 0.1),main="Ricker") 
setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/")
save(rickerplot, file = "Ricker.RData")

##gLV
glvplot=tsplot(glv (N, A=A, tend=15, b = runif(N, min = 0, max = 0.5)), main="gLV")
setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/")
save(glvplot, file = "gLV.RData")

##SOI
#No se cuántos individuos poner >:c 
soiplot=tsplot(soi(N, A=A, I=20, tend=15), main= "SOI")
#ERROR: Error in params[[5]][[l]] : subíndice fuera de  los límites
setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/")
save(soiplot, file = "Soi.RData")

#Hubbell
#Qué poner en metacomunidad (M)
M = 100
hubplot
metapop <- generateAbundances(N = M, mode = 5, probabs = TRUE)
tsplot(simHubbell(N = N, M = M, I = 20, d = N, m=0.1,  m.vector = metapop, tskip=500, tend=1000))



