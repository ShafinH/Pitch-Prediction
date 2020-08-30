import pandas as pd
from sklearn.datasets import make_blobs
from sklearn.model_selection import train_test_split
import numpy as np
import matplotlib.pyplot as plt

df_final = pd.read_csv("data-for-models/df_final.csv")

df_final.head()