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

##Ricker
tend = 15
sigm = c(0.01,0.05,0.1)
cap = 0.01

for (sig in sigm) {
  pdf(paste("Ricker", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "sigma =", sig, "K =", cap, ".pdf"))
  rickerplot=tsplot(ricker(N,A=A,K=rep(cap,N), tend=tend, sigma = sig), main = paste("Ricker", "%ep =", pep, "c =", conec, "σ =", sig, "K =", cap), legend = TRUE ) 
  dev.off() 
  setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/RICKER/")
  save(rickerplot, file = paste("Ricker", "N =", N, "Tiempo = ", tend, "pep =", pep, "c =", conec, "sigma =", sig, "K =", cap, ".RData"))
}

