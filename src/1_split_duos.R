# To take in student survey responses, split duos, and cause other havoc

# setup ####

# no packages needed

# in/out ####

.out_loc_1 = "./data/duo1.csv"
.out_loc_2 = "./data/duo2.csv"

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

# re-merge ####

# merge the duos as individuals
duos = rbind(duo1, duo2)

# randomize order
duos = duos[sample(1:nrow(duos)), ]

# memory loss
duos$alter = ifelse(runif(nrow(duos), 0, 1) < .4, NA, duos$alter)

# introduce data gremlin
duos = rbind(duos, c("Data Gremlin", "green", NA, sample(duos$hometown, 1)))

# Send to far off places ####

# pick a random desitnation (dataframe) for individuals
duos$dest = sample(c(1,2), nrow(duos), TRUE)

# split based on destination

desert = duos[duos$dest == 1, -5]
swamp = duos[duos$dest == 2, -5]

# clean up ####

# reindex dataframes
row.names(desert) = 1:nrow(desert)
row.names(swamp) = 1:nrow(swamp)

# clean old objects
rm(duo1, duo2, duos)


