# LIST DATA FILES

# Parameters
path_rawdata = "../Reproduction Package/Raw-Data/"
path_code = "../Reproduction Package/Code/"

# Read all raw file names
files = list.files(path_rawdata)

# Exclude analytic file names
files = files[files != "micro_dataset.dta"]

# Exclude crime files
files = files[! files %in% c("chicago_crime.csv", "Chicago_Crime_Interstate_Distance_0606.csv")]

paste(files, collapse = "; ")

# Read all code file names
files = list.files(path_code)
df = data.frame(File = files)
write.csv2(df, file = "Code Files.csv")