EfficiencyScrapTransform<-function(scrapDF){
  #This script will be used to rearrange the data into a format that is workable with
  #the efficiency gap function. It will also be removing all unconstested districts from
  #data. I realize that this is not the most accurate way to measure a state, but as of
  #this time I have not determined a good way to repersent those districts. 
  library(plyr)
  
  state<-unique(scrapDF$State)
  
  EF_frame = data.frame(District = 0, R_votes = 0, D_votes = 0, I_votes = 0)
  
  for(i in state){
    temp<-subset(scrapDF, scrapDF[,5] == i)
    for (j in 1:len(temp)){
      if(is.na(temp[j,3]) == TRUE){
        next
      }
      if(substr(temp[j,1]) == "D"){  #assigns to correct district by match between the 2 DF's
        EF_frame[temp[j,4],3]<-temp[j,3]
        EF_frame
      }
    }
  }
  
}