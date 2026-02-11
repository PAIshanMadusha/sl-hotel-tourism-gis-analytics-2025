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

# ==============================================================================
# OUTLIER DETECTION
# ==============================================================================

# 13. Boxplots for numeric variables to visually inspect outliers
par(mfrow = c(2, 4))
boxplot(hotel$RoomsAvailable, main = "Rooms Available", col = "lightblue")
boxplot(hotel$OccupancyRate, main = "Occupancy Rate", col = "lightgreen")
boxplot(hotel$ADR, main = "ADR", col = "lightyellow")
boxplot(hotel$MarketingSpend, main = "Marketing Spend", col = "lightpink")
boxplot(hotel$StaffCount, main = "Staff Count", col = "lightcyan")
boxplot(hotel$GuestSatisfactionScore, main = "Guest Satisfaction", col = "lavender")
boxplot(hotel$LoyaltyMembers, main = "Loyalty Members", col = "lightgray")
boxplot(hotel$Revenue, main = "Revenue", col = "lightsalmon")
par(mfrow = c(1, 1))

# ==============================================================================
# NORMALITY TESTS (HYPOTHESIS-BASED)
# ==============================================================================

# 14. Shapiro-Wilk test for normality on numeric variables
cat("\nSHAPIRO-WILK NORMALITY TESTS\n")
cat("\nRevenue:\n")
print(shapiro.test(hotel$Revenue))

cat("\nOccupancy Rate:\n")
print(shapiro.test(hotel$OccupancyRate))

cat("\nADR:\n")
print(shapiro.test(hotel$ADR))

cat("\nMarketing Spend:\n")
print(shapiro.test(hotel$MarketingSpend))

cat("\nGuest Satisfaction Score:\n")
print(shapiro.test(hotel$GuestSatisfactionScore))

cat("\nLoyalty Members:\n")
print(shapiro.test(hotel$LoyaltyMembers))

# 15. Q-Q plots for visual assessment of normality for numeric variables
par(mfrow = c(2, 3))
qqnorm(hotel$Revenue, main = "Q-Q Plot: Revenue")
qqline(hotel$Revenue, col = "red", lwd = 2)

qqnorm(hotel$OccupancyRate, main = "Q-Q Plot: Occupancy Rate")
qqline(hotel$OccupancyRate, col = "red", lwd = 2)

qqnorm(hotel$ADR, main = "Q-Q Plot: ADR")
qqline(hotel$ADR, col = "red", lwd = 2)

qqnorm(hotel$MarketingSpend, main = "Q-Q Plot: Marketing Spend")
qqline(hotel$MarketingSpend, col = "red", lwd = 2)

qqnorm(hotel$GuestSatisfactionScore, main = "Q-Q Plot: Guest Satisfaction")
qqline(hotel$GuestSatisfactionScore, col = "red", lwd = 2)

qqnorm(hotel$LoyaltyMembers, main = "Q-Q Plot: Loyalty Members")
qqline(hotel$LoyaltyMembers, col = "red", lwd = 2)
par(mfrow = c(1, 1))

# ==============================================================================
# DISTRIBUTION HISTOGRAMS
# ==============================================================================

# 16. Histograms with density lines for numeric variables to visualize distributions
par(mfrow = c(2, 3))

hist(hotel$Revenue,
     main = "Distribution of Hotel Revenue",
     xlab = "Revenue (USD)",
     col = "lightblue",
     probability = TRUE
)
lines(density(hotel$Revenue), col = "red", lwd = 2)

hist(hotel$OccupancyRate,
     main = "Distribution of Occupancy Rate",
     xlab = "Occupancy Rate",
     col = "lightgreen",
     probability = TRUE
)
lines(density(hotel$OccupancyRate), col = "red", lwd = 2)

hist(hotel$ADR,
     main = "Distribution of ADR",
     xlab = "ADR (USD)",
     col = "lightyellow",
     probability = TRUE
)
lines(density(hotel$ADR), col = "red", lwd = 2)

hist(hotel$MarketingSpend,
     main = "Distribution of Marketing Spend",
     xlab = "Marketing Spend (USD)",
     col = "lightpink",
     probability = TRUE
)
lines(density(hotel$MarketingSpend), col = "red", lwd = 2)

hist(hotel$GuestSatisfactionScore,
     main = "Distribution of Guest Satisfaction",
     xlab = "Guest Satisfaction Score",
     col = "lavender",
     probability = TRUE
)
lines(density(hotel$GuestSatisfactionScore), col = "red", lwd = 2)

hist(hotel$LoyaltyMembers,
     main = "Distribution of Loyalty Members",
     xlab = "Loyalty Members",
     col = "lightgray",
     probability = TRUE
)
lines(density(hotel$LoyaltyMembers), col = "red", lwd = 2)
par(mfrow = c(1, 1))
