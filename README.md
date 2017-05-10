# Voting-Efficiency
 
 ### A set of R scripts that can be used to scrape and process voting data from the 2016 election and to determine the voting efficiency based on the paper: https://www.brennancenter.org/sites/default/files/legal-work/How_the_Efficiency_Gap_Standard_Works.pdf

The Limits of this set of scripts is to the 2016 election.  Data collection of previous elections, while important, is not in my planned scope for this project.  

Analysis Gaps: 
1) This analysis only covers the Gap between Republicans and Democrats, not indepenents. This could be an important feature to add in the future, but as the scripts are currently constructed, there is no function for that. 

2) Uncontested seats - In this form of the scripts, they do not affect the results other than to mask whatever voting would normally take place in that distrtict. They are treated effectively as double zero votes, so no change in net votes. 
