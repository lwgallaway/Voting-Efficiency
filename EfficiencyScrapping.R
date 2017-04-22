EfficiencyScrapping<-function(){
  library(httr)
  library(plyr)
  library(rvest)
  library(datasets)
  library(stringr)
  
  #setup up the scrapping loop by states
  state<-tolower(state.name)
  state<-str_replace_all(state,fixed(" "),"-")
  URL<-"http://www.politico.com/2016-election/results/map/house/"
  
  finalDF<-NULL
  
  for(i in state){
    print(i)
    newURL<-paste(URL,i,"/",sep = "")  #adding state name to URL
    dat<-httr::GET(newURL)
    tab<-rvest::html_table(content(dat))
    for(j in 1:length(tab)){       #adding districts to the data set
      tab[[j]]$x4<-j      #adding district number to the data set
    }
    formed<-ldply(tab)
    formed$x5<-i  #adding state to the data set
    names(formed)<-c("Candidate","Vote Share","Vote Total","District","State")
    if(is.null(finalDF) == TRUE){ #combining into a large data frame
      finalDF<-formed
    } else {
      finalDF<-rbind(finalDF,formed)
    }
    Sys.sleep(3)  #sleep function to not overwhelm the site
  }
  
  return(finalDF)
}