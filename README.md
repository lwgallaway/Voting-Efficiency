# Voting-Efficiency
 
 ### A set of R scripts that can be used to scrape and process voting data from the 2016 election and to determine the voting efficiency based on the paper: https://www.brennancenter.org/sites/default/files/legal-work/How_the_Efficiency_Gap_Standard_Works.pdf

The purview of this project is exclusively to the 2016 election.  Data collection of previous elections, while important, is not in my planned scope for this project.  

Sourcing:
All voting data collected for this project is from Polictico.com, who sourced their results from the AP. The mathematical foundations for this project come from the Brennan Center. Please visit their site https://www.brennancenter.org for information on voting rights.

Analysis Gaps: 
1) This analysis only covers the Gap between Republicans and Democrats, not independents. Independent voting was considered in the voting totals for each district however.

2) Uncontested seats - In this form of the scripts, they do not affect the results other than to mask whatever voting would normally take place in that district. They are treated effectively as zero votes for both parties, so no change in net votes.

