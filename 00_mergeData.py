import pandas as pd

atbats = pd.read_csv("data-raw/atbats.csv",
                     keep_default_na=False, na_values=[""])

pitches = pd.read_csv("data-raw/pitches.csv",
                      keep_default_na=False, na_values=[""])

player_names = pd.read_csv("data-raw/player_names.csv",
                           keep_default_na=False, na_values=[""])


merged_data = pitches.merge(atbats, how = 'left', left_on = 'ab_id', right_on = 'ab_id') # merging the atbats and pitches files

# merged_data.to_csv('/Users/shafin/Desktop/Pitch/data-clean/pitches_with_at_bats.csv') # creating csv file with the dataframe


merged_data.head()