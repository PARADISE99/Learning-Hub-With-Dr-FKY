# -*- coding: utf-8 -*-
"""
Created on Tue Mar 25 04:33:30 2025

@author: Dr. Firdos Khan
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Generate synthetic data
np.random.seed(42)
num_rows, num_cols = 10, 10  # Grid size
temperature = np.random.uniform(15, 40, (num_rows, num_cols))  # Temperature in Celsius
precipitation = np.random.uniform(0, 100, (num_rows, num_cols))  # Precipitation in mm

# Convert to DataFrame for easier handling
df = pd.DataFrame({
    'X': np.tile(np.arange(num_cols), num_rows),
    'Y': np.repeat(np.arange(num_rows), num_cols),
    'Temperature': temperature.flatten(),
    'Precipitation': precipitation.flatten()
})

# Plot the heatmap
plt.figure(figsize=(8, 6))
pivot_temp = df.pivot("Y", "X", "Temperature")
ax = sns.heatmap(pivot_temp, cmap="coolwarm", annot=True, fmt=".1f", linewidths=0.5, cbar_kws={'label': 'Temperature (°C)'})

# Overlay precipitation as bubbles
for _, row in df.iterrows():
    plt.scatter(row["X"] + 0.5, row["Y"] + 0.5, s=row["Precipitation"], color='black', alpha=0.6)

plt.title("Bivariate Heatmap: Temperature (Color) & Precipitation (Bubble Size)")
plt.xlabel("Longitude Index")
plt.ylabel("Latitude Index")
plt.show()
