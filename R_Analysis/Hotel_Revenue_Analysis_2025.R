# Project: Statistical and Business Analytics of Hotel Revenue
# Author: PAIshanMadusha
# Purpose: Analysis of Sri Lanka's Hotel and Tourism Sector
# ==============================================================================

# 1. CLEAR ENVIRONMENT
rm(list = ls())

# 2. INSTALL AND LOAD REQUIRED LIBRARIES
if (!require(psych)) install.packages("psych")
if (!require(car)) install.packages("car")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(corrplot)) install.packages("corrplot")

library(ggplot2)
library(psych)
library(car)
library(corrplot)

# 3. LOAD DATASET
hotel <- read.csv("../Data/HOTELS_2025.csv")



