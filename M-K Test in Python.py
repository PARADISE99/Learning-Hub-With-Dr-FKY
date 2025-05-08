# -*- coding: utf-8 -*-
"""
Created on Thu May  8 21:46:22 2025

@author: Dr. Firdos Khan
"""

###############################################################################

import pymannkendall as mk          # For M-K Test
import matplotlib.pyplot as plt     # For Plotting the data before M-K Test
import numpy as np

# Sample time series data (e.g., temperature, precipitation)
data = [1.2, 2.4, 2.1, 3.5, 3.3, 3.9, 4.2, 4.4, 4.8, 5.0]


###### Plot the data

# Create a time axis (e.g., years or time steps)
time = list(range(1, len(data) + 1))

# Plotting
plt.figure(figsize=(8, 4))
plt.plot(time, data, marker='o', linestyle='-', color='blue', label='Time Series Data')
plt.title('Time Series with Decreasing Trend')
plt.xlabel('Time')
plt.ylabel('Value')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()


# Perform the Mann-Kendall test
result = mk.original_test(data)

# Print the results
print(result)


###############################################################################


import pymannkendall as mk
import numpy as np

# Time series with a decreasing trend
data = [10.2, 9.8, 9.5, 9.3, 8.9, 8.7, 8.3, 7.9, 7.5, 7.2]

# Create a time axis (e.g., years or time steps)
time = list(range(1, len(data) + 1))

# Plotting
plt.figure(figsize=(8, 4))
plt.plot(time, data, marker='o', linestyle='-', color='blue', label='Time Series Data')
plt.title('Time Series with Decreasing Trend')
plt.xlabel('Time')
plt.ylabel('Value')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

# Perform the Mann-Kendall test
result = mk.original_test(data)

# Print the full result
print(result)

###############################################################################

################## Understanding the Output ##########################
The result is a named tuple with:

trend: 'increasing', 'decreasing', or 'no trend'

h: True (if significant trend), False otherwise

p: p-value of the significance test

z: normalized test statistic

Tau: Kendall Tau coefficient

s: Mann-Kendall's S statistic

var_s: Variance of S

slope: Sen’s slope estimate

intercept: Intercept of the trend line