EfficiencyScrapTransform<-fucntion(scrapDF){
  #This script will be used to rearrange the data into a format that is workable with
  #the efficiency gap function. It will also be removing all unconstested districts from
  #data. I realize that this is not the most accurate way to measure a state, but as of
  #this time I have not determined a good way to repersent those districts. 
  library(plyr)
  
  state<-unique(scrapDF$State)
  
  EF_frame = data.frame(District = 0, R_votes = 0, D_votes = 0, I_votes = 0)
  
  for(i in state){
    subset(scrapDF, scrapDF[,5] == i)
    
  }
  
}