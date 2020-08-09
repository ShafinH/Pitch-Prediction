import pandas as pd

atbats = pd.read_csv("data-raw/atbats.csv",
                     keep_default_na=False, na_values=[""])

pitches = pd.read_csv("data-raw/pitches.csv",
                      keep_default_na=False, na_values=[""])

player_names = pd.read_csv("data-raw/player_names.csv",
                           keep_default_na=False, na_values=[""])


# print(atbats.head())

merged_data = pd.merge(atbats, pitches)

print(atbats.head())
