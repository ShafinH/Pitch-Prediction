model
df_final
new_data = 
  tibble(
    s_count = 2,
    b_count = 2,
    pitch_num = 5,
    on_1b = 1,
    on_2b = 0,
    on_3b = 0,
    pitcher_id = 452657,
    stand = 'R',
    p_throws = 'L',
    last_ff_not= 'CU/SL'
  )
?predict
predict(model, new_data, type="response")
