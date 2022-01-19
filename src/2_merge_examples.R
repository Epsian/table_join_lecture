# to make example dataframes for merge practice

# rbind example
upper_rbind_df = data.frame("name" = c("Lorelai Gilmore", "Kiki", "Link"), "color" = c("Orange", "Red", "Green"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)
lower_rbind_df = data.frame("name" = c("Rory Gilmore", "Jiji", "Zelda"), "color" = c("Yellow", "Indigo", "Violet"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)

# cbind example
left_cbind_df = data.frame("name" = c("Lorelai Gilmore", "Kiki", "Link"), "color" = c("Orange", "Red", "Green"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)
right_cbind_df = data.frame("name" = c("Rory Gilmore", "Jiji", "Zelda"), "color" = c("Yellow", "Indigo", "Violet"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)

# key merge example
left_merge_df = data.frame("name" = c("Lorelai Gilmore", "Razputin Aquato", "Link"), "color" = c("Orange", "Green", "Green"), "hometown" = c("Stars Hollow", "Whispering Rock", "Castle Town"), stringsAsFactors = FALSE)
right_merge_df = data.frame("name" = c("Rory Gilmore", "Jiji", "Zelda"), "color" = c("Yellow", "Indigo", "Violet"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)
