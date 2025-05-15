#### M_K script for monthly station wise data


# Step 1: Load libraries
library(openxlsx)    # Open MS Excel File
library(Kendall)     # M-K Test
library(trend)       # M-K Test
library(dplyr)       # Reshaping data
library(tibble)      # Formatting the data

# Step 2: Read the Excel file
file_path <- "E:/Material-for-My-Youtube-Channel/2025/Learning Hub/May/M-K_Test_Multiple_Parameters_on_Monthly_Basis/Monthly_Prec_Total_Biaseline.xlsx"
df <- read.xlsx(file_path, sheet = 1)
  

# Step 3: Drop 'year' if present
df_data <- df %>% select(-year)

# Step 4: Initialize empty result list
result_list <- list()

# Step 5: Loop through each column
for (col_name in colnames(df_data)) {
  series <- df_data[[col_name]]
  
# Step 6: Remove NA if any
  series <- series[!is.na(series)]
  
# Step 7: Run MK and Sen's slope
  mk <- MannKendall(series)
  sen <- sens.slope(series)
  
#Step 8: Store results
  result_list[[col_name]] <- tibble(
    Series   = col_name,
    Tau      = mk$tau,
    P_value  = mk$sl,
    Slope    = sen$estimates,
    Lower_CI = sen$conf.int[1],
    Upper_CI = sen$conf.int[2]
  )
}

# Step 9: Combine all results
Monthly_results <- bind_rows(result_list)

# Step 10: View and export
print(Monthly_results)


#Step 11: Save the results to CSV
write.csv(Monthly_results, "E:/Material-for-My-Youtube-Channel/2025/Learning Hub/May/M-K_Test_Multiple_Parameters_on_Monthly_Basis/Monthly_Prc-Tot_trends-01.csv", row.names = FALSE)

######################################## THE END ###########################################
