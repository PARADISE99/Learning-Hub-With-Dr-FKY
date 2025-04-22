#######################################################
### 1. Install Necessary Packages
### Install and load the required R packages.

library(biwavelet) # For bi-wavelet coherence analysis
library(ggplot2)   # For color palettes
library(viridis)   # For enhanced plotting
#######################################################
### 2. Load Your Data
### Prepare your time series data.

# Example data
time_series1 <- cumsum(rnorm(100))  # Simulated time series 1
time_series2 <- cumsum(rnorm(100))  # Simulated time series 2

data <- data.frame(time = 1:100, series1 = time_series1, series2 = time_series2)


### 3. Perform Bi-Wavelet Coherence Analysis
### Use the biwavelet package for coherence analysis.

library(biwavelet)

# Convert data to matrix
ts1_matrix <- data.matrix(data[, c("time", "series1")])
ts2_matrix <- data.matrix(data[, c("time", "series2")])

# Perform coherence analysis
#coherence <- wt.coh(ts1_matrix, ts2_matrix)
coherence <- wtc(ts1_matrix, ts2_matrix)

### 4. Visualize Bi-Wavelet Coherence
### Customize the visualization for publication-ready figures.

library(viridis)

# Plot wavelet coherence
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     main = "Bi-Wavelet Coherence",
     ylab = "Period",
     xlab = "Time")

### 5. Enhance the Plot with Additional Layers
### If you want to overlay significance levels or other annotations:

par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
# Overlay significance contours
plot(coherence, 
     plot.cb = TRUE,
     colormap = viridis(256),
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Enhanced Bi-Wavelet Coherence",
     ylab = "Period",
     xlab = "Time")

### 6. Save the Figure
### Export the figure in high resolution

png("biwavelet_coherence.png", width = 10, height = 6, units = "in", res = 300)
plot(coherence, 
     plot.cb = TRUE,
     colormap = viridis(256),
     main = "Bi-Wavelet Coherence",
     ylab = "Period",
     xlab = "Time")
dev.off()



#######################################################################################
################################### With Our Own Data #################################
#######################################################################################

##################################### Reading Climate Data ############################

setwd("D:/DrFKY_Research_Activities/DrFKY_MS-Students/2023/Beenish/Paper/Analysis/Coherence/Climate Data")

AnAveMxTMP<-read.csv("AnAveMax -TMP_Zone-01.csv", sep=",")
AnMinMaxTMP<-read.csv("AnMinMax -TMP_Zone-01.csv", sep=",")
AnMaxMaxTMP<-read.csv("AnMaxMax -TMP_Zone-01.csv", sep=",")

AnAvePPT<-read.csv("PPT_Zone-03_Annual-Ave.csv", sep=",")
AnMinPPT<-read.csv("PPT_Zone-03_Annual-Min.csv", sep=",")
AnMaxPPT<-read.csv("PPT_Zone-03_Annual-Max.csv", sep=",")


AnAveMinTMP<-read.csv("MinMP_Zone-03_Annual-Ave.csv", sep=",")
AnMinMinTMP<-read.csv("MinMP_Zone-03_Annual-Min.csv", sep=",")
AnMaxMinTMP<-read.csv("MinMP_Zone-03_Annual-Max.csv", sep=",")


##################################### Reading Fruit Data ############################

setwd("D:/DrFKY_Research_Activities/DrFKY_MS-Students/2023/Beenish/Paper/Analysis/Coherence/Fruites and Vagetables/")

App<-read.csv("Apple.csv", sep=",")
Grps<-read.csv("Grapes.csv", sep=",")
Aprc<-read.csv("Appricot.csv", sep=",")
Dates<-read.csv("Dates.csv", sep=",")
Pomogr<-read.csv("Pomegranate.csv", sep=",")
Peach<-read.csv("Peach.csv", sep=",")
Onin<-read.csv("Onion.csv", sep=",")


##################################### Reading Crop Data ############################
setwd("D:/DrFKY_Research_Activities/DrFKY_MS-Students/2023/Beenish/Paper/Analysis/Coherence/Grains/")


Wht<-read.csv("Wheat.csv", sep=",")
Rice<-read.csv("Rice.csv", sep=",")
Ses<-read.csv("Sesamum.csv", sep=",")
Cott<-read.csv("Cotton.csv", sep=",")
Bar<-read.csv("Barley.csv", sep=",")
Jwr<-read.csv("Jowar.csv", sep=",")

###########################################################################################

par(mfrow=c(2,3))
# Perform coherence analysis
coherence <- wtc(head(AnMinMaxTMP, n=30), Aprc)

### 4. Visualize Bi-Wavelet Coherence
### 5. Enhance the Plot with Additional Layers
### If you want to overlay significance levels or other annotations:

# Overlay significance contours
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
plot(coherence, 
     plot.cb = TRUE,
     colormap = viridis(256),
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual min of Max TMP and Apprecot",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")


#####################################################################################

###################### AnMinMaxTMP and Cotton #########################
coherence <- wtc(head(AnMaxMaxTMP, n=30), Cott)
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual maximum of Max TMP and Cotton",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")



#####################################################################################


###################### AnMaxMinTMP and Rice #########################
coherence <- wtc(head(AnMaxMinTMP, n=30), Rice)
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual maximum of Min TMP and Rice",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")


###################### AnMinMaxTMP and Barley #########################
coherence <- wtc(head(AnAvePPT, n=300), Bar)
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual average precipitation and Barley",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")




#####################################################################################



###################### AnMaxMaxPPT and Rice #########################
coherence <- wtc(head(AnMaxPPT, n=30), Rice)
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual maximum precipitation and Rice",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")

###################### AnMaxMaxPPT and Cotton #########################
coherence <- wtc(head(AnMaxPPT, n=30), Cott)
plot(coherence, 
     plot.cb = TRUE,         # Add a color bar
     colormap = viridis(256),# High-quality color palette
     lwd.sig = 2,            # Line width for significance
     plot.phase = TRUE,      # Include phase arrows
     main = "Annual maximum precipitation and Cotton",
     ylab = "Period",
     xlab = "Time",
     xaxt="", cex.axis=1.3, cex.lab=1.3, yaxt="")

     ####################### THE END #########################


