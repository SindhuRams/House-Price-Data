# House-Price-Data-RShiny_Dashboard-Project

SUMMARY

The House Pricing Dataset has data of around 1460 variables with 8 observation which contains columns like neighborhood, building type, house style, overall quality of the house with sale price being the target variable. Here I tried the classification technique of K-means clustering by plotting with variables like Overall quality, year, sale price and House style and concluded using the same in RShiny Dashboard. The purpose of using the classification technique is to check the variables giving a better plot and understanding the dataset in depth to find the necessary input variables for the side panel.

The input variables I took for the RShiny dashboard are the
Number of fireplaces as select Input type having values from 0-3, 
Sale Price range from 34900-75500 being a slider Input and lastly 
the Building type having values like 1Fam: Single Family,2fmCon: Two Family converged, Duplex: Duplex houses, Twnhs: Town house Inside Unit, TwnhsE: Town House End Unit. 

The House Style values are: Style of dwelling: 1Story:One story, 1.5Fin:One and one-half story: 2nd level finished,1.5Unf:One and one-half story: 2nd level unfinished,
2Story:Two story,2.5Fin: Two and one-half story: 2nd level finished,2.5Unf:Two and one-half story: 2nd level unfinished, SFoyer: Split Foyer, SLvl: Split Level

OverallQual: Rates the overall material and finish of the house
10: Very Excellent, 9: Excellent,8: Very Good, 7: Good, 6: Above Average,5: Average, 4: Below Average,3: Fair,2: Poor, 1: Very Poor.

The Business Question that I would like to solve here is that we can see that the House Style and the Overall Quality of the house is having this much number of Fireplaces and also the Plot of Sale Price vs Year shows that the Sale Price of data increase or decreases according the number of Fireplaces as this increases the square feet of the house which in a way increases the sale price. 

This all graph also interactively changes with the Building type which is the space for dwelling.  
