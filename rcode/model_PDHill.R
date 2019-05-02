# Model parameters E0, Emax, gamma, ED50, followed by variances, correlation (0.245) and error variance (10%)
parpop<-c(5,30,500,2)
nampar<-c("E0","Emax","ED50","gamma")
omega<-diag(c(0.09,0.49,0.49))
omega[3,2]<-omega[2,3]<-0.245
respar<-c(0.1)

pvrai<-c(5,30,500,2,0.09,0.490,0.245,0.490,sqrt(0.01))
pfaux<-c(10,60,1000,1,0.1,0.1,0.01,0.1,sqrt(0.0625))

# PD models, Emax and Hill
modelhill<-function(psi,id,xidep) {
  # input:
  #   psi : matrix of parameters (4 columns, E0, Emax, E50, gamma)
  #   id : vector of indices 
  #   xidep : dependent variables (same nb of rows as length of id)
  # returns:
  #   a vector of predictions of length equal to length of id
  dose<-xidep[,1]
  e0<-psi[id,1]
  emax<-psi[id,2]
  e50<-psi[id,3]
  gamma<-psi[id,4]
  f<-e0+emax*dose**gamma/(e50**gamma+dose**gamma)
  return(f)
}

modelemax<-function(psi,id,xidep) {
  # input:
  #   psi : matrix of parameters (3 columns, E0, Emax, E50)
  #   id : vector of indices 
  #   xidep : dependent variables (same nb of rows as length of id)
  # returns:
  #   a vector of predictions of length equal to length of id
  dose<-xidep[,1]
  e0<-psi[id,1]
  emax<-psi[id,2]
  e50<-psi[id,3]
  f<-e0+emax*dose/(e50+dose)
  return(f)
}
