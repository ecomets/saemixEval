##########################################################################
### Librairies and functions - saemix
rootDir<-"/home/eco/work/monolix/rversion/newLib"
simDir<-file.path(rootDir,"zesims")
saemixDir<-"/home/eco/work/monolix/rversion/newLib/saemix"
setwd(saemixDir)
source(file.path(rootDir,"saemix","testeco","helper-source.R"))

# library(saemix)
library(MASS)

##########################################################################
estim.parOrig<-FALSE # estimate parameters for original simulated datafiles

# PD model, sparse design
nsim<-200
for(iscenar in 4:6) {
  cat("Estimating parameters for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  source(file.path(simDir,"rcode","create_saemixModel.R"))
  source(file.path(simDir,"rcode","run_saemixModel.R"))
}

# PD model, IIV 30%
nsim<-200
for(iscenar in 7:9) {
  cat("Estimating parameters for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  source(file.path(simDir,"rcode","create_saemixModel.R"))
  source(file.path(simDir,"rcode","run_saemixModel.R"))
}
##########################################################################
