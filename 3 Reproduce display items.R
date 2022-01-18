# REPRODUCE DISPLAY ITEMS

# Packages
library(haven)

# Parameters
path_rawdata = "../Reproduction Package/Raw-Data/"
variables = c("stand_crimes", "route_num1_mod", "side_dummy", "year", "month", "day", "treatment")

# ITEM 1 - TABLE 4

# Load data
df_all = as.data.frame(read_dta(paste0(path_rawdata, "micro_dataset.dta"))) # 1 sec
df = df_all[, variables]
df$side_dummy = as.character(df$side_dummy)
df$year = as.character(df$year)
df$month = as.character(df$month)
df$day = as.character(df$day)
df$treatment = as.character(df$treatment)

# Column (2)
mod.2 = lm(data = df, formula = stand_crimes ~ route_num1_mod + side_dummy + treatment)
mat.2 = summary(mod.2)$coefficients
nc = nrow(mat.2)
mat.2[nc,]

# Column (3)
t0 = Sys.time()
mod.3 = lm(data = df, formula = stand_crimes ~ route_num1_mod + side_dummy + year + month + day + treatment)
print(Sys.time() - t0)
mat.3 = summary(mod.3)$coefficients
nc = nrow(mat.3)
mat.3[nc,]


