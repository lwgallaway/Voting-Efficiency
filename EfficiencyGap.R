EfficiencyGap<-function(dataframe){
  #reference 
  #https://www.brennancenter.org/sites/default/files/legal-work/How_the_Efficiency_Gap_Standard_Works.pdf
  # for additional information about formaula used in this script.
  h<-nrow((dataframe))
  results<-data.frame(District = dataframe[,1], R_votes_wasted = rep(0,h), D_votes_wasted = rep(0,h), Net_Wasted_D_votes = rep(0,h), Total_votes = rep(0,h))
  
  for(i in 1:h){    
    tot<-sum(dataframe[i,c(2:4)])  #sum of the votes in that district
    results[i,5]<-tot
    if(dataframe[i,2] > dataframe[i,3]){ #Reps win the district
      results[i,2]<-(dataframe[i,2] - (tot+1)/2)
      results[i,3]<-dataframe[i,3]
      results[i,4]<-results[i,2] - results[i,3] #Negative means D votes wasted, + R votes
    }
    if(dataframe[i,3] > dataframe[i,2]){ #Dems win the district
      results[i,2]<-dataframe[i,2] 
      results[i,3]<-(dataframe[i,3] - (tot+1)/2)
      results[i,4]<-results[i,2] - results[i,3]
    }
    
  }
  waste<-sum(results[,4])/sum(results[,5])
  
  return(waste)
}