# To take in student survey responses, split duos, and cause other havoc

# setup ####

# no packages needed

# in/out ####

# nothing saved or loaded from disk

# Data formatting ####

# rename columns
colnames(.raw_survey) = c("time", "mem1", "mc1", "mem2", "mc2", "hometown")

# trim all white space
.raw_survey$mem1 = trimws(.raw_survey$mem1)
.raw_survey$mc1 = trimws(.raw_survey$mc1)
.raw_survey$mem2 = trimws(.raw_survey$mem2)
.raw_survey$mc2 = trimws(.raw_survey$mc2)
.raw_survey$hometown = trimws(.raw_survey$hometown)

# remove any odd spacing
.raw_survey$mem1 = gsub("\\s+", " ", .raw_survey$mem1)
.raw_survey$mc1 = gsub("\\s+", " ", .raw_survey$mc1)
.raw_survey$mem2 = gsub("\\s+", " ", .raw_survey$mem2)
.raw_survey$mc2 = gsub("\\s+", " ", .raw_survey$mc2)
.raw_survey$hometown = gsub("\\s+", " ", .raw_survey$hometown)

# make sure home towns are unique

.raw_survey$hometown = ifelse(duplicated(.raw_survey$hometown), paste0(.raw_survey$hometown, " (", row.names(.raw_survey), ")"), .raw_survey$hometown)

# Data split ####

duo1 = .raw_survey[, c("mem1", "mc1", "mem2", "hometown")]
colnames(duo1) = c("name", "color", "alter", "hometown")

duo2 = .raw_survey[, c("mem2", "mc2", "mem1", "hometown")]
colnames(duo2) = c("name", "color", "alter", "hometown")

# mess with data ####

# to upper all duo1 hometowns
duo1$hometown = toupper(duo1$hometown)

# swap spaces with underscores in duo2
duo2$hometown = gsub(" ", "_", duo2$hometown)

# unbalance dataframes
duo2 = rbind(duo2, duo1[1:floor(nrow(duo1)*.2), ])
duo1 = duo1[-c(1:floor(nrow(duo1)*.2)), ]

# memory loss
duo1$alter = ifelse(1:nrow(duo1)%%2 == 0, NA, duo1$alter)
duo2$alter = ifelse(1:nrow(duo2)%%2 == 0, NA, duo2$alter)

# randomize order
duo1 = duo1[sample(1:nrow(duo1)), ]
duo2 = duo2[sample(1:nrow(duo2)), ]

# reindex dataframes
row.names(duo1) = 1:nrow(duo1)
row.names(duo2) = 1:nrow(duo2)

# introduce data gremlin
# disabled for now
# duos = rbind(duos, c("Data Gremlin", "green", NA, sample(duos$hometown, 1)))

# Send to far off places ####

california = duo1
massachusetts = duo2

# clean up ####

# clean old objects
rm(duo1, duo2)


