# -*- coding: utf-8 -*-
"""
Created on Mon Mar 17 22:41:34 2025

@author: Dr. Firdos Khan
"""

import requests
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Define API URL (Example: Extreme temperature for a given location)
url = "https://power.larc.nasa.gov/api/temporal/daily/point?parameters=T2M_MAX,T2M_MIN&community=AG&longitude=73.0479&latitude=33.6844&start=20230101&end=20231231&format=JSON"

# Fetch data from NASA POWER API
response = requests.get(url)
data = response.json()

# Extract temperature data
df = pd.DataFrame({
    "Date": list(data["properties"]["parameter"]["T2M_MAX"].keys()),
    "Max_Temp": list(data["properties"]["parameter"]["T2M_MAX"].values()),
    "Min_Temp": list(data["properties"]["parameter"]["T2M_MIN"].values())
})

# Convert Date column to datetime
df["Date"] = pd.to_datetime(df["Date"])

# Reshape data for heatmap
df["Month"] = df["Date"].dt.month
df["Day"] = df["Date"].dt.day
heatmap_data = df.pivot("Day", "Month", "Max_Temp")

heatmap_data = df.pivot(index="Day", columns="Month", values="Max_Temp")


# Plot Heatmap
plt.figure(figsize=(12, 6))
sns.heatmap(heatmap_data, cmap="coolwarm", annot=False)
plt.title("Heatmap of Daily Maximum Temperature (NASA POWER)")
plt.xlabel("Month")
plt.ylabel("Day")
plt.show()
