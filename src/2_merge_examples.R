# to make example dataframes for merge practice

# cbind example
e1_cbind = data.frame("name" = c("Lorelai Gilmore", "Kiki", "Link"), "color" = c("Orange", "Red", "Green"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)
e2_cbind = data.frame("name" = c("Rory Gilmore", "Jiji", "Zelda"), "color" = c("Yellow", "Indigo", "Violet"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)

# key merge example
e1_key = data.frame("name" = c("Lorelai Gilmore", "Razputin Aquato", "Link"), "color" = c("Orange", "Green", "Green"), "hometown" = c("Stars Hollow", "Whispering Rock", "Castle Town"), stringsAsFactors = FALSE)
e2_key = data.frame("name" = c("Rory Gilmore", "Jiji", "Zelda"), "color" = c("Yellow", "Indigo", "Violet"), "hometown" = c("Stars Hollow", "Koriko", "Castle Town"), stringsAsFactors = FALSE)
