
################################################################################
################################### Taylor Diagram #############################
################################################################################

# Install the Required libraries
install.packages("plotrix") 

# Load the required libraries
library(plotrix)

# Set your path the data
setwd("E:/Material-for-My-Youtube-Channel/2025/Learning Hub/April/Taylor_Diagram_Plotrix")

# Open your data file
TD<-read.csv("FAIS_TN10P_Monthly_TD.csv", sep=",", header = TRUE)

# Check the data
head(TD)
# Simulated model outputs (7 models)
obs<-TD[, 2]
ANN <- TD[, 3]
SVM <- TD[, 4]
GBM <- TD[, 5]
RF <- TD[, 6]
GRU <- TD[, 7]
LSTM <- TD[, 8]
RNN <- TD[, 9]

par(mar=c(4, 4, 0.5, 0.5))
# Define colors and symbols for each model
colors <- c("blue", "red", "green", "purple", "orange", "brown", "cyan")
symbols <- c(19, 17, 15, 18, 8, 3, 4)

# Plot the first model to create the base Taylor Diagram
taylor.diagram(obs, ANN, col = colors[1], pch = symbols[1],
               main = "Taylor Diagram: 7 Model Comparison", pos.cor = TRUE, cex=2)

# Add the rest of the models to the plot
taylor.diagram(obs, SVM, add = TRUE, col = colors[2], pch = symbols[2])
taylor.diagram(obs, GBM, add = TRUE, col = colors[3], pch = symbols[3])
taylor.diagram(obs, RF, add = TRUE, col = colors[4], pch = symbols[4])
taylor.diagram(obs, GRU, add = TRUE, col = colors[5], pch = symbols[5])
taylor.diagram(obs, LSTM, add = TRUE, col = colors[6], pch = symbols[6])
taylor.diagram(obs, RNN, add = TRUE, col = colors[7], pch = symbols[7])

# Add a legend
legend("topright",
       legend = paste(c("ANN", "SVM", "GBM", "RF", "GRU", "LSTM", "RNN")),
       col = colors,
       pch = symbols)

############################ THE END ######################################

