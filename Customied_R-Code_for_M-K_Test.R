# Load libraries
library(openxlsx)
library(Kendall)
library(trend)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(viridis)

# Step 1: Read the Excel file
setwd("E:/Material-for-My-Youtube-Channel/2025/Learning Hub/May/Customized_R-Code_M-K_Test")
df <- read.xlsx("Input_Data.xlsx")


# Step 2: Drop 'year' column if necessary
df <- df %>% select(-year)

# Step 3: Reshape data to long format
df_long <- df %>%
  pivot_longer(cols = -c(), names_to = "Station", values_to = "Vlues")


#Step 4: Run M-K Test and Store the results
monthly_results <- df_long %>%
  group_by(Station) %>%
  summarise(
    Z_statistic = mk.test(Vlues)$statistic,   # Z statistic
    P_value = mk.test(Vlues)$p.value,         # p-value
    .groups = "drop"
  )

#Step 5: Save the results to CSV
write.csv(monthly_results, "E:/Material-for-My-Youtube-Channel/2025/Learning Hub/May/Customized_R-Code_M-K_Test/Output_Date_Trends.csv", row.names = FALSE)


##############################################################################################################
################################################## THE END ###################################################
##############################################################################################################