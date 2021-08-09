#Maria Fernanda Bravo Garcia
#Aquí trato de hacer ciclos para c/u de los modelos.  
setwd("~/Microtesis/Tesis1/02.SCRIPTS/FUNCIONES/") 

#Librerias 
library(seqtime)
library(ggplot2)
library(reshape2)
library(igraph)

#Matriz 
N = 10 
pep = 10
conec = 0.05
A = generateA(N,"klemm", pep = pep, c = conec)

##MODELOS
tend = 15

##Ricker
sigm = c(0.01,0.05,0.1)
cap = 0.01

for (sig in sigm) {
  pdf(paste("Ricker", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "sigma =", sig, "K =", cap, ".pdf"))
  rickerplot=tsplot(ricker(N,A=A,K=rep(cap,N), tend=tend, sigma = sig), main = paste("Ricker", "%ep =", pep, "c =", conec, "σ =", sig, "K =", cap), legend = TRUE ) 
  dev.off() 
  setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/RICKER/")
  save(rickerplot, file = paste("Ricker", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "sigma =", sig, "K =", cap, ".RData"))
}


##gLV
grmin = 0
grmax = 0.5

pdf(paste("gLV", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "tasa crecimiento", grmin, "-", grmax, ".pdf"))
glvplot=tsplot(glv (N, A=A, tend=tend, b = runif(N, min = grmin, max = grmax)), main = paste("gLV", "%ep =", pep, "c =", conec, "tasa crecimiento", grmin, "-", grmax), legend = TRUE )
dev.off() 
setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/gLV/")
save(glvplot, file = paste("gLV", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "tasa crecimiento", grmin, "-", grmax,".RData"))

##SOI
ind = 200
emin = 0
emax = 1

pdf(paste("SOI", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "Individuos", ind, ".pdf"))
soiplot=tsplot(soi(N, A=A, I=ind, tend=tend, e.vector = runif(N, min = emin, max = emax) ),main = paste("SOI", "%ep =", pep, "c =", conec, "Individuos", ind), legend = TRUE )
dev.off() 
setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/SOI/")
save(soiplot, file = paste("SOI", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "Individuos", ind, ".RData"))