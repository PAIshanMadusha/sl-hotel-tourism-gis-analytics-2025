# ==============================================================================
# Project: Statistical and Business Analytics of Hotel Revenue
# Author: PAIshanMadusha
# Purpose: Analysis of Sri Lanka's Hotel and Tourism Sector
# ==============================================================================

# 1. Crate a clean environment
rm(list = ls())

# 2. Install and load necessary packages
if (!require(psych)) install.packages("psych")
if (!require(car)) install.packages("car")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(corrplot)) install.packages("corrplot")

# GGPlot2 for data visualization
library(ggplot2)
# Psych for descriptive statistics
library(psych)
# Car for regression diagnostics
library(car)
# Corrplot for correlation matrix visualization
library(corrplot)

# 3. Load the dataset
hotel <- read.csv("../Data/HOTELS_2025.csv")

# ==============================================================================
# DATA CLEANING AND INSPECTION
# ==============================================================================

# 4. Data structure
cat("\nDATA STRUCTURE\n")
str(hotel)

# 5. Summary statistics
cat("\nSUMMARY STATISTICS\n")
summary(hotel)

# 6. First few rows of the dataset
cat("\nFIRST 6 ROWS\n")
head(hotel)

# 7. Check for missing values
cat("\nMISSING VALUES CHECK\n")
cat("Total missing values:", sum(is.na(hotel)), "\n")
cat("Missing values per column:\n")
print(colSums(is.na(hotel)))

# 8. Remove rows with missing values (if any)
if (sum(is.na(hotel)) > 0) {
  hotel <- na.omit(hotel)
  cat("Rows with missing values removed!\n")
  cat("New dataset size:", nrow(hotel), "rows\n")
}

# 9. Check data types
cat("\nDATA TYPES\n")
print(sapply(hotel, class))

# 10. Convert categorical variables to factors
hotel$HotelQualityRank <- factor(hotel$HotelQualityRank,
  levels = c("Low", "Medium", "High")
)

# 11. Check for duplicates
cat("\nDUPLICATE CHECK\n")
cat("Number of duplicate rows:", sum(duplicated(hotel)), "\n")

# 12. Descriptive statistics for numeric variables
cat("\nDESCRIPTIVE STATISTICS\n")
describe(hotel[, c(
  "RoomsAvailable",
  "OccupancyRate",
  "ADR",
  "MarketingSpend",
  "StaffCount",
  "GuestSatisfactionScore",
  "LoyaltyMembers",
  "Revenue"
)])


