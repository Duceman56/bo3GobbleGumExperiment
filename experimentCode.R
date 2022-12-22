library(googlesheets4)
library(GGally)
library(corrplot)

##random gobble gum generator
sample(1:15, size = 5, replace = F) 

##data importation
gs4_deauth() ##allows the sheet to be viewed in unauthorized mode
sheet <- "https://docs.google.com/spreadsheets/d/1PZ4H1Lnyv-11ehDW7Lj8KyD6KKoVNgVculjrZg0_Vdk/edit?usp=sharing" ##reads the URL

df <- read_sheet(sheet) ##reads the sheet within the URL
View(df) ##views the sheet in a separate window

##Visualizations
hist(df$gble_gum_id, breaks = 14)
hist(df$round_number)
plot.default(df$round_number, df$gble_gum_id)

##Correlation Test
cor.test(df$round_number, df$gble_gum_id)
cor.test(df$round_number, df$gble_gum_id, alternative = "two.sided", method = 'pearson', conf.level = .90)
cor(df$round_number, df$gble_gum_id, method = "spearman")

cor.test(df$map_id, df$gble_gum_id)

##Resorces/Refferences
#https://geog-370.netlify.app/resources/09-correlation/