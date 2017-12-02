#' A Gerrymandering Function
#'
#' This script will be used to rearrange the data into a format that is workable with
#' the efficiency gap function. It will also be removing all unconstested districts from
#' data. I realize that this is not the most accurate way to measure a state, but as of
#' this time I have not determined a good way to repersent those districts. 
#' @param scrapDF This is the output data frame from the EfficiencyScrapping function. 
#' @keywords gerrymandering, data cleaning
#' @export
#' @examples
#' EfficiencyScrapTransform(scrapOutput)

EfficiencyScrapTransform<-function(scrapDF){
  #This script will be used to rearrange the data into a format that is workable with
  #the efficiency gap function. It will also be removing all unconstested districts from
  #data. I realize that this is not the most accurate way to measure a state, but as of
  #this time I have not determined a good way to repersent those districts. 
  library(stringr)
  
  state<-unique(scrapDF$State)
  scrapDF[,3]<-str_replace_all(scrapDF[,3],fixed(","),"")
  scrapDF[,3]<-as.numeric(scrapDF[,3])
  scrapDF[is.na(scrapDF)]<-0  #changes all NA's to zeros to fixed uncontested districts
  
  
  proList = split(1:length(state),list(state))
  t<-0
  for(i in state){
    t<-t+1
    temp<-subset(scrapDF, scrapDF[,5] == i)
    h<-unique(temp[,4])
    w<-length(h)
    EF_frame = data.frame(District = h, R_votes = rep(0,w), D_votes = rep(0,w), I_votes = rep(0,w))
    for (j in 1:nrow(temp)){
      if(substr(temp[j,1],0,1) == "D"){  #assigns to correct district by match between the 2 DF's
        EF_frame[temp[j,4],3]<-temp[j,3]
      } else if (substr(temp[j,1],0,1) == "R"){ #matches to Republicans
        EF_frame[temp[j,4],2]<-temp[j,3]
      } else {  #adds all independents together
        EF_frame[temp[j,4],4]<-as.numeric(EF_frame[temp[j,4],4])+as.numeric(temp[j,3])
      }
    }
    proList[[t]]<-EF_frame
  }
  return(proList)
  
}
