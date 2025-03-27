# -*- coding: utf-8 -*-
"""
Created on Fri Mar 28 00:11:54 2025

@author: Dr. Firdos Khan
"""

import folium
import pandas as pd
from folium.plugins import HeatMap
import branca.colormap as cm  # Import colormap for color bar

# Sample crime data (Latitude, Longitude, Crime Count)
crime_data = [
    [40.7128, -74.0060, 5],   # New York
    [34.0522, -118.2437, 15], # Los Angeles
    [41.8781, -87.6298, 8],   # Chicago
    [29.7604, -95.3698, 12],  # Houston
    [39.9526, -75.1652, 10]   # Philadelphia
]

# Convert to DataFrame
crime_df = pd.DataFrame(crime_data, columns=["Latitude", "Longitude", "Crime Count"])

# Create a base map
crime_map = folium.Map(location=[crime_df["Latitude"].mean(), crime_df["Longitude"].mean()], zoom_start=5)

# Add HeatMap layer with weight based on Crime Count
HeatMap(crime_df[["Latitude", "Longitude", "Crime Count"]].values, radius=30, blur=20, max_zoom=10).add_to(crime_map)

# Create a color scale (legend)
colormap = cm.LinearColormap(
    colors=["blue", "green", "yellow", "red"],  # Colors from low to high crime
    vmin=crime_df["Crime Count"].min(),  # Minimum crime count
    vmax=crime_df["Crime Count"].max(),  # Maximum crime count
    caption="Crime Frequency"  # Label for the legend
)

# Add color scale to the map
crime_map.add_child(colormap)

# Save and display map
crime_map.save("crime_heatmap_with_legend.html")
crime_map

