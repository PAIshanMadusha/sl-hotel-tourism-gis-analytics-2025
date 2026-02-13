# ==============================================================================
# Project : R_SL_Tourists_2025
# Author  : PAIshanMadusha
# Purpose : Prepare tourist arrival data (2025) and export CSV for GIS analysis
# ==============================================================================

# 1. Create a clean environment
rm(list = ls())

# 2. Install and load necessary packages
if (!require(readxl)) {
  install.packages("readxl")
  library(readxl)
}

# 3. Read Excel file (skip first row because it contains title text)
tourists_raw <- read_excel(
  "../Data/All_Countries_Jan_August_2025.xlsx",
  skip = 1
)

# 4. View structure
str(tourists_raw)

# 5. Rename columns for clarity
# Column 2 = Country
# Column 11 = Total
colnames(tourists_raw)[2] <- "Country"
colnames(tourists_raw)[11] <- "Total_Tourists_2025"

# 6. Select only required columns
SL_Tourists_2025 <- tourists_raw[, c("Country", "Total_Tourists_2025")]

# 7. Remove unwanted rows (like header row inside data)
SL_Tourists_2025 <- SL_Tourists_2025[!is.na(SL_Tourists_2025$Country), ]

# Remove the row where Country = "Country"
SL_Tourists_2025 <- SL_Tourists_2025[SL_Tourists_2025$Country != "Country", ]

# 8. Convert total column to numeric
SL_Tourists_2025$Total_Tourists_2025 <-
  as.numeric(SL_Tourists_2025$Total_Tourists_2025)

# 9. Export CSV file
write.csv(
  SL_Tourists_2025,
  "SL_Tourists_2025.csv",
  row.names = FALSE
)

# 10. Confirm export
cat("CSV file created successfully!")

# 11. Verify the CSV file exists
if (file.exists("SL_Tourists_2025.csv")) {
  cat("CSV file exists in working directory!")
} else {
  cat("CSV file does not exist in working directory!")
}

# 12. View the cleaned data
head(SL_Tourists_2025)

# 13. Check structure of the cleaned data
str(SL_Tourists_2025)

# ===============================================================================
# End of SL_Tourists_2025_DataPrep.R
# ===============================================================================
