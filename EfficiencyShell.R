EfficiencyShell<-function(){
  #shell will provided the guide to actually using and outputting this data
  
  print("Welcome to the Voting Efficiency library for the 2016 election.")
  print("Please choose how you would like to proceed.")
  print('1: Collect the Voting data for the 2016 House Election.') 
  print('2: Review the methods behind the Voting Efficiency model.')
  print('3: Output the Voting Efficiences for each state in the 2016 election.')
  print('4: Exit')
  n<-readline(prompt = "Please enter your selection: ")


  if(n ==1){
    USHousevoting<<-EfficiencyScrapping()
    processed<<-EfficiencyScrapTransform(USHousevoting)
    print('Please see Data Frame USHousevoting for Raw voting information')
    print("Please print the list \'processed\' to see the votes by distrct per state ")
  }
  if(n==2){
    print("please visit the site:")
    print("https://www.brennancenter.org/sites/default/files/legal-work/How_the_Efficiency_Gap_Standard_Works.pdf")
    print("for more information about the Efficiency Gap method for measuring Gerrymandering")
  }
  if(n == 3){
    q<-names(processed)
    StateVotingEfficiency<-data.frame(state = q, Voting_Efficiency = rep(0,length(q)))
    for(i in 1:length(processed)){
      StateVotingEfficiency[i,2]<-EfficiencyGap(processed[[i]])
    }
    print(StateVotingEfficiency)
    print("Please See the StateVotingEfficiency data frame for the information")
    StateVotingEfficiency<<-StateVotingEfficiency
  }
}
