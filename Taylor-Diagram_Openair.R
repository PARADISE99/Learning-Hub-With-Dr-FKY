
################################################################################
################################### Taylor Diagram #############################
################################################################################

# Install the Required libraries
install.packages("openair") 

# Load the required libraries
library(openair)

# Set your path the data
setwd("D:/DrFKY_Research_Activities_26-09-2023_NCU/Climate-Extremes-Analysis/Analysis/evaluation/Temperature-Extremes/Taylor Digram")

# Open your data file
TD<-read.csv("FAIS_TN10P.csv", sep=",")

# Check the data
head(TD)

# Plot the Taylor Diagram

TaylorDiagram(TD, obs="obs", mod="mod", group = "Models", main="",
              key = TRUE, key.title = "Models", cex =2 , fontsize = 15)


############################ THE END ######################################

