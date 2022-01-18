# 1 INSPECT FILES AND SAVE LIGHTER VERSIONS

# Packages
library(haven)

# Parameters
path_rawdata = "../Reproduction Package/Raw-Data/"
path_intermediate_data = "../Reproduction Package/Intermediate Data/"

# Clean memory
rm(df)

# Read all file names
files = list.files(path_rawdata)

# "chicago_aqi_2000_2015.dta"
i=1
# Load
t0 = Sys.time()
df = as.data.frame(read_dta(paste0(path_rawdata, files[i]))) # 2 min
print(Sys.time() - t0)
#

# chicago_crime.csv
# Load
t0 = Sys.time()
df = read.csv(paste0(path_rawdata, "chicago_crime.csv")) # 1.9 min
print(Sys.time() - t0)
# Save lighter version
columns = c("ID", "Case.Number", "Date", "Block", "IUCR", "Beat", "District", "Ward", "Community.Area", "FBI.Code", "X.Coordinate", "Y.Coordinate", "Year", "Latitude", "Longitude")
df_crime = df_crime[, columns]
t0 = Sys.time()
write.csv(df, file = paste0(path_data_intermediate, "chicago_crime.csv")) # 3.9 min
print(Sys.time() - t0)

# micro_dataset.dta
t0 = Sys.time()
df = as.data.frame(read_dta(paste0(path_rawdata, "micro_dataset.dta"))) # 1 sec
print(Sys.time() - t0)
# Save lighter version
t0 = Sys.time()
write.csv(df, file = paste0(path_intermediate_data, "micro_dataset.csv")) # 15 sec
print(Sys.time() - t0)
