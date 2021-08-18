#Maria Fernanda Bravo Garcia
#Aquí trato de hacer las repeticiones de las series de tiempo aaaaaaaaaaaaaaa. 

## Ricker No sale idk 

##gLV
objetos_glv<-list()


for (x in 1:5) {
  tsglv = glv (N, A=A, tstep = 1, tend=tend, b = runif(N, min = grmin, max = grmax))
  objetos_glv[[x]]<-tsglv 
}


x<-matrix(,nrow = 10,ncol = 15)
p<-c()
for(k in 1:5){
  for(i in 1:10){
    for(j in 1:15){
      p[k]<-objetos_glv[[k]][i,j]
      print(p[k])  }}
  for(h in 1:5){
    for(l in 1:10){
      x[h,l]<-mean(p)
}
}}
    

    
    #objetos_glv<-list()
    #objetos_glv[[tsglv]]
    