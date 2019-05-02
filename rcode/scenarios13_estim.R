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

# PD model, rich design
nsim<-200
for(iscenar in 2:3) {
  cat("Estimating parameters for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  source(file.path(simDir,"rcode","create_saemixModel.R"))
  source(file.path(simDir,"rcode","run_saemixModel.R"))
}

iscenar<-3
cat("Evaluating parameter estimates for example",iscenar,"\n")
source(file.path(simDir,"rcode","select_model.R"))
source(file.path(simDir,"rcode","create_saemixModel.R"))
source(file.path(simDir,"rcode","assess_estimPar.R"))

