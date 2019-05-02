if(iscenar %in% c(1:9)) {
  source(file.path(simDir,"rcode","model_PDHill.R"))
}

# Scenario PD 1 - Emax model
if(iscenar %in% c(1,4,7)) {
  namsimdat<-"pdemax"
  parpop<-parpop[-c(4)]
  nampar<-nampar[-c(4)]
  modfun<-modelemax
}

# Scenario PD 2 - Hill model, gamma=2
if(iscenar %in% c(2,5,8)) {
  namsimdat<-"pdhillmed"
  parpop[4]<-2
  modfun<-modelhill
}

# Scenario PD 3 - Hill model, gamma=3
if(iscenar %in% c(3,6,9)) {
  namsimdat<-"pdhillhigh"
  parpop[4]<-3
  modfun<-modelhill
}

# Scenario PD with rich design
if(iscenar %in% c(1:3,7:9)) {
  design<-"rich"
  nsuj<-100
  simdos<-c(0,100,300,1000)
  xidep<-data.frame(id=rep(1:nsuj,each=length(simdos)), dose=rep(simdos,nsuj))
}

# Scenario PD with low variability and high residual error (IIV 30%, residual error 50%)
if(iscenar %in% c(7:9)) {
  namsimdat<-paste(namsimdat,"iiv",sep=".")
  omega<-diag(c(0.09,0.09,0.09))
  omega[3,2]<-omega[2,3]<-0.5*.09
  respar<-c(0.5)
}

# Scenarios PD 4-6, similar to 1-3 but with sparse design (2 doses per subject) and 200 subjects (same nb of observations)

if(iscenar %in% c(4:6)) {
  design<-"sparse"
  nsuj<-200
  simdos<-c(0,100,300,1000)
  xidep<-data.frame(id=rep(1:50,each=2), dose=rep(c(0,1000),50))  
  xidep<-rbind(xidep,
               data.frame(id=rep(51:100,each=2), dose=rep(c(100,1000),50)),
               data.frame(id=rep(101:150,each=2), dose=rep(c(0,300),50)),
               data.frame(id=rep(151:200,each=2), dose=rep(c(100,300),50)))
}
if(iscenar %in% c(7:9)) {
  saemix.options$nbiter.saemix<-c(500,200)
}

namsimDir<-paste(namsimdat,design,sep=".")
datDir<-file.path(simDir,"simData",namsimDir)
resDir<-file.path(simDir,"simEstim",namsimDir)



