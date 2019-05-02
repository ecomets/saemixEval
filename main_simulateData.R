##########################################################################
# Directories
rootDir<-"/home/eco/work/monolix/rversion/newLib"
setwd(rootDir)
simDir<-file.path(rootDir,"zesims")

### Librairies and functions - saemix
saemixDir<-"/home/eco/work/monolix/rversion/newLib/saemix"
setwd(saemixDir)
source(file.path(saemixDir,"testeco","helper-source.R"))

dir.create(file.path(simDir,"simData"))
dir.create(file.path(simDir,"simEstim"))

##########################################################################
# Simulation examples
#####################
simulate.data<-TRUE # Simulate original data

# PD model, rich design
nsim<-200
for(iscenar in 1:3) {
  cat("Simulating data for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  dir.create(datDir)
  dir.create(resDir)
  # Répertoire de sauvegarde
  #dir.create(saveDir)
  source(file.path(simDir,"rcode","simulate_data.R"))
}

# PD model, sparse design
nsim<-200
for(iscenar in 4:6) {
  cat("Simulating data for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  dir.create(datDir)
  dir.create(resDir)

  source(file.path(simDir,"rcode","create_saemixModel.R"))
  source(file.path(simDir,"rcode","simulate_data.R"))
}

# PD model, 30% IIV, 50% residual variability
nsim<-200
for(iscenar in 7:9) {
  cat("Simulating data for example",iscenar,"\n")
  source(file.path(simDir,"rcode","select_model.R"))
  dir.create(datDir)
  dir.create(resDir)
  
  source(file.path(simDir,"rcode","create_saemixModel.R"))
  source(file.path(simDir,"rcode","simulate_data.R"))
}

##########################################################################
