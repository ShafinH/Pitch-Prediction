import pandas as pd

atbats = pd.read_csv("data-raw/atbats.csv",
                     keep_default_na=False, na_values=[""])

pitches = pd.read_csv("data-raw/pitches.csv",
                      keep_default_na=False, na_values=[""])

player_names = pd.read_csv("data-raw/player_names.csv",
                           keep_default_na=False, na_values=[""])


# print(atbats.head())

merged_data = pitches.merge(atbats, how = 'left', left_on = 'ab_id', right_on = 'ab_id')

merged_data.rename(cloumns={'event': 'at_bat_outcome'})

merged_data.to_csv('/Users/shafin/Documents/GitHub/Pitch/data-clean/test_clean.csv') 

print(merged_data.head())