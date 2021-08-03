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
pep = 34
A = generateA(N,"klemm", pep = pep, c = 0.05)

##Ricker
tend = 15
sigm = c(0.01, 0.05, 0.1)
for (sig in sigm) {
  pdf(paste("Ricker", sig, ".pdf"))
  rickerplot=tsplot(ricker(N,A=A,K=rep(0.01,N), tend=tend, sigma = sig), main = paste("Ricker", sig)) 
  setwd("~/Microtesis/Tesis1/03.OUTPUT/PLOTS/")
  save(rickerplot, file = paste("Ricker", sig, ".RData"))
  dev.off() 
  
}

