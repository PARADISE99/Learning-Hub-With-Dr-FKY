# -*- coding: utf-8 -*-
"""
Created on Wed Feb  5 23:29:33 2025

@author: Dr. Firdos Khan
"""
###############################################################################
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

# Generate random data
np.random.seed(42)
X = np.random.rand(100, 2)

# Apply K-Means
kmeans = KMeans(n_clusters=3, random_state=42, n_init=10)
labels = kmeans.fit_predict(X)

# Plot clusters
plt.scatter(X[:, 0], X[:, 1], c=labels, cmap='viridis', alpha=0.7, edgecolors='k')
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], c='red', marker='X', s=200, label='Centroids')
plt.legend()
plt.show()

########################### THE END ###########################################