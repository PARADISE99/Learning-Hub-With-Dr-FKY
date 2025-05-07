#######################################################
### 1. Install Necessary Packages
### Install and load the required R packages.
# Install and load the package
#install.packages("Kendall")
library(Kendall)

# Example time series
ts_data <- c(2.1, 2.5, 2.7, 3.0, 3.1, 3.3, 3.5, 3.6, 3.9, 4.1)
plot(ts_data, type = "o", main = "Generated Data with Positive Trend", ylab = "Value", xlab = "Time")


# Perform Mann-Kendall test
MannKendall(ts_data)


####################################################################################

# Install and load the package
#install.packages("trend")
library(trend)

# Example time series
ts_data <- c(2.1, 2.5, 2.7, 3.0, 3.1, 3.3, 3.5, 3.6, 3.9, 4.1)
plot(ts_data, type = "o", main = "Generated Data with Positive Trend", ylab = "Value", xlab = "Time")

# Perform Mann-Kendall test
mk.test(ts_data)


####################################################################################

# Load required package
library(trend)

# Generate time series with a negative trend
set.seed(123)
n <- 50
time <- 1:n
data <- 100 - 0.5 * time + rnorm(n, mean = 0, sd = 2)  # linear decline + noise

# Plot
plot(time, data, type = "o", main = "Synthetic Data with Negative Trend", ylab = "Value", xlab = "Time", col="blue")

# Mann-Kendall Test
mk_result <- mk.test(data)
print(mk_result)



     ####################### THE END #########################


