#' A Gerrymandering Function
#'
#' This function is for the determining the voting efficiency in a particular state.
#' returns a single percentage for the state. Anything greater than +/- 8 indicates 
#' gerrymandering in a state. Negative for republican, postive for democrat.
#' @param dataframe This should be a dataframe containing the district number, republican
#' votes, democrat votes and independent votes, in that order. 
#' @keywords gerrymandering
#' @export
#' @examples
#' EfficiencyGap(OhioDistricts)
#' 
#' dataframe ex.
#' district  R_votes D_votes I_votes
#' 1          2000    1500     0
#' 2          1500    2500     200

EfficiencyGap<-function(dataframe){
  #reference 
  #https://www.brennancenter.org/sites/default/files/legal-work/How_the_Efficiency_Gap_Standard_Works.pdf
  # for additional information about formaula used in this script.
  h<-nrow((dataframe))
  results<-data.frame(District = dataframe[,1], R_votes_wasted = rep(0,h), D_votes_wasted = rep(0,h), Net_Wasted_D_votes = rep(0,h), Total_votes = rep(0,h))
  
  for(i in 1:h){    
    tot<-sum(dataframe[i,c(2:4)])  #sum of the votes in that district
    results[i,5]<-tot #writing the vote total to the results frame
    if(dataframe[i,2] > dataframe[i,3]){ #Reps win the district
      results[i,2]<-(dataframe[i,2] - (tot+1)/2)   #takes the republic votes minus half the total plus 1 - should be  positive number
      results[i,3]<-dataframe[i,3]  #all of the D's votes are wasted
      results[i,4]<-results[i,2] - results[i,3] #Negative means D votes wasted, + R votes wasted.
    }
    if(dataframe[i,3] > dataframe[i,2]){ #Dems win the district
      results[i,2]<-dataframe[i,2] #all the Republicans votes are wasted
      results[i,3]<-(dataframe[i,3] - (tot+1)/2) #takes D votes minus half the vote toatl, should be positive.
      results[i,4]<-results[i,2] - results[i,3] #Negative means D votes wasted, + R votes wasted.
    }
    
  }
  waste<-sum(results[,4])/sum(results[,5])
  waste<-100*round(waste,3)
  
  return(waste)
}