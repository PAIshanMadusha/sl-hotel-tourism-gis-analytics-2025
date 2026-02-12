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

# ==============================================================================
# CORRELATION ANALYSIS
# ==============================================================================

# 17. Correlation matrix for numeric variables to identify relationships between factors and revenue
cat("\n=== CORRELATION MATRIX ===\n")
cor_matrix <- cor(hotel[, c(
     "RoomsAvailable", "OccupancyRate", "ADR",
     "MarketingSpend", "StaffCount",
     "GuestSatisfactionScore", "LoyaltyMembers", "Revenue"
)])
print(round(cor_matrix, 3))

# 18. Visualize the correlation matrix using corrplot
corrplot(cor_matrix,
     method = "color",
     type = "upper",
     addCoef.col = "black",
     tl.col = "black",
     tl.srt = 45,
     title = "Correlation Matrix - Hotel Revenue Factors",
     mar = c(0, 0, 2, 0)
)

# 19. Individual Pearson correlation tests between Revenue and each numeric variable to assess the strength and significance of relationships
cat("\nPEARSON CORRELATION TESTS\n")

cat("\nRevenue vs Occupancy Rate:\n")
print(cor.test(hotel$Revenue, hotel$OccupancyRate, method = "pearson"))

cat("\nRevenue vs ADR:\n")
print(cor.test(hotel$Revenue, hotel$ADR, method = "pearson"))

cat("\nRevenue vs Marketing Spend:\n")
print(cor.test(hotel$Revenue, hotel$MarketingSpend, method = "pearson"))

cat("\nRevenue vs Guest Satisfaction Score:\n")
print(cor.test(hotel$Revenue, hotel$GuestSatisfactionScore, method = "pearson"))

cat("\nRevenue vs Loyalty Members:\n")
print(cor.test(hotel$Revenue, hotel$LoyaltyMembers, method = "pearson"))

cat("\nRevenue vs Rooms Available:\n")
print(cor.test(hotel$Revenue, hotel$RoomsAvailable, method = "pearson"))

cat("\nRevenue vs Staff Count:\n")
print(cor.test(hotel$Revenue, hotel$StaffCount, method = "pearson"))

# ==============================================================================
# SCATTER PLOTS WITH REGRESSION LINES
# ==============================================================================

# 20. SCATTER PLOT: Revenue vs Occupancy Rate
plot(hotel$OccupancyRate, hotel$Revenue,
     xlab = "Occupancy Rate",
     ylab = "Revenue (USD)",
     main = "Revenue vs Occupancy Rate",
     pch = 19,
     col = rgb(0, 0, 1, 0.5)
)
abline(lm(Revenue ~ OccupancyRate, data = hotel), col = "red", lwd = 2)

# 21. SCATTER PLOT: Revenue vs ADR
plot(hotel$ADR, hotel$Revenue,
     xlab = "Average Daily Rate (ADR)",
     ylab = "Revenue (USD)",
     main = "Revenue vs ADR",
     pch = 19,
     col = rgb(0, 0.5, 0, 0.5)
)
abline(lm(Revenue ~ ADR, data = hotel), col = "blue", lwd = 2)

# 22. SCATTER PLOT: Revenue vs Marketing Spend
plot(hotel$MarketingSpend, hotel$Revenue,
     xlab = "Marketing Spend (USD)",
     ylab = "Revenue (USD)",
     main = "Revenue vs Marketing Spend",
     pch = 19,
     col = rgb(0.5, 0, 0.5, 0.5)
)
abline(lm(Revenue ~ MarketingSpend, data = hotel), col = "darkgreen", lwd = 2)

# 23. SCATTER PLOT: Revenue vs Guest Satisfaction
plot(hotel$GuestSatisfactionScore, hotel$Revenue,
     xlab = "Guest Satisfaction Score",
     ylab = "Revenue (USD)",
     main = "Revenue vs Guest Satisfaction Score",
     pch = 19,
     col = rgb(1, 0.5, 0, 0.5)
)
abline(lm(Revenue ~ GuestSatisfactionScore, data = hotel), col = "purple", lwd = 2)

# 24. SCATTER PLOT: Revenue vs Loyalty Members
plot(hotel$LoyaltyMembers, hotel$Revenue,
     xlab = "Loyalty Members",
     ylab = "Revenue (USD)",
     main = "Revenue vs Loyalty Members",
     pch = 19,
     col = rgb(0, 0.5, 0.5, 0.5)
)
abline(lm(Revenue ~ LoyaltyMembers, data = hotel), col = "brown", lwd = 2)

# 25. SCATTER PLOT: Revenue vs Rooms Available
plot(hotel$RoomsAvailable, hotel$Revenue,
     xlab = "Rooms Available",
     ylab = "Revenue (USD)",
     main = "Revenue vs Rooms Available",
     pch = 19,
     col = rgb(0.5, 0.5, 0, 0.5)
)
abline(lm(Revenue ~ RoomsAvailable, data = hotel), col = "navy", lwd = 2)

# ==============================================================================
# SIMPLE LINEAR REGRESSION MODELS
# ==============================================================================

# 26. MODEL 1: Revenue ~ Occupancy Rate
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ OccupancyRate\n")
model_occ <- lm(Revenue ~ OccupancyRate, data = hotel)
summary(model_occ)

# 27. MODEL 2: Revenue ~ ADR
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ ADR\n")
model_adr <- lm(Revenue ~ ADR, data = hotel)
summary(model_adr)

# 28. MODEL 3: Revenue ~ Marketing Spend
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ MarketingSpend\n")
model_marketing <- lm(Revenue ~ MarketingSpend, data = hotel)
summary(model_marketing)

# 29. MODEL 4: Revenue ~ Guest Satisfaction Score
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ GuestSatisfactionScore\n")
model_satisfaction <- lm(Revenue ~ GuestSatisfactionScore, data = hotel)
summary(model_satisfaction)

# 30. MODEL 5: Revenue ~ Loyalty Members
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ LoyaltyMembers\n")
model_loyalty <- lm(Revenue ~ LoyaltyMembers, data = hotel)
summary(model_loyalty)

# 31. MODEL 6: Revenue ~ Rooms Available
cat("\nSIMPLE LINEAR REGRESSION: Revenue ~ RoomsAvailable\n")
model_rooms <- lm(Revenue ~ RoomsAvailable, data = hotel)
summary(model_rooms)

# ==============================================================================
# MULTIPLE LINEAR REGRESSION MODEL
# ==============================================================================

# 32. FULL MODEL: Revenue ~ All Significant Predictors
cat("\nMULTIPLE LINEAR REGRESSION MODEL\n")
model_full <- lm(
     Revenue ~ RoomsAvailable + OccupancyRate + ADR +
          MarketingSpend + StaffCount + GuestSatisfactionScore +
          LoyaltyMembers,
     data = hotel
)
summary(model_full)

# ==============================================================================
# MULTICOLLINEARITY CHECK
# ==============================================================================

# 33. Calculate Variance Inflation Factor (VIF) for each predictor in the full model
cat("\nVARIANCE INFLATION FACTOR (VIF)\n")
vif_values <- vif(model_full)
print(vif_values)

cat("\nVIF Interpretation:\n")
cat("VIF < 5: No multicollinearity\n")
cat("VIF 5-10: Moderate multicollinearity\n")
cat("VIF > 10: High multicollinearity (problematic)\n\n")

for (i in 1:length(vif_values)) {
     if (vif_values[i] < 5) {
          status <- "No multicollinearity"
     } else if (vif_values[i] < 10) {
          status <- "Moderate multicollinearity"
     } else {
          status <- "High multicollinearity"
     }
     cat(sprintf("%s: %.3f [%s]\n", names(vif_values)[i], vif_values[i], status))
}

# ==============================================================================
# MODEL DIAGNOSTICS
# ==============================================================================

# 34. Diagnostic plots for the full multiple linear regression model to check assumptions
par(mfrow = c(2, 2))
plot(model_full)
par(mfrow = c(1, 1))

# 35. Calculate Cook's distance to identify influential observations in the full model
cooksd <- cooks.distance(model_full)
plot(cooksd,
     type = "h",
     main = "Cook's Distance - Influential Observations",
     ylab = "Cook's Distance",
     xlab = "Observation Index"
)
abline(h = 4 / nrow(hotel), col = "red", lty = 2)
text(
     x = 1:length(cooksd),
     y = cooksd,
     labels = ifelse(cooksd > 4 / nrow(hotel),
          names(cooksd), ""
     ),
     pos = 3,
     cex = 0.7
)

# ==============================================================================
# RESIDUAL ANALYSIS
# ==============================================================================

# 36. Shapiro-Wilk test for normality of residuals from the full multiple linear regression model
cat("\nNORMALITY TEST ON RESIDUALS\n")
residuals_full <- residuals(model_full)
shapiro_residuals <- shapiro.test(residuals_full)
print(shapiro_residuals)

# 37. Histogram of residuals with density line to visually assess the distribution of residuals from the full model
hist(residuals_full,
     main = "Distribution of Residuals",
     xlab = "Residuals",
     col = "lightblue",
     probability = TRUE
)
lines(density(residuals_full), col = "red", lwd = 2)

# 38. Q-Q plot of residuals to visually assess normality of residuals from the full model
qqnorm(residuals_full, main = "Q-Q Plot: Residuals")
qqline(residuals_full, col = "red", lwd = 2)

# ==============================================================================
# ANOVA TEST (MODEL SIGNIFICANCE)
# ==============================================================================

# 39. ANOVA test to compare the full multiple linear regression model against a null model (intercept only) to assess overall model significance
cat("\nANOVA TEST (Overall Model Significance)\n")
anova_result <- anova(model_full)
print(anova_result)
