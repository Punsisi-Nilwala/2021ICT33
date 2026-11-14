# Bioinformatics ICA 3
# Diabetes Dataset - Data Preprocessing

# 1. Import the original dataset
diabetes <- read.csv("data/diabetes.csv")

# 2. Check dataset dimensions
dim(diabetes)

# 3. Display column names
names(diabetes)

# 4. Check data structure
str(diabetes)

# 5. Generate summary statistics
summary(diabetes)

# 6. Create a copy of the original dataset
diabetes_clean <- diabetes

# 7. Identify columns containing invalid zero values
columns_to_clean <- c(
  "Glucose",
  "BloodPressure",
  "SkinThickness",
  "Insulin",
  "BMI"
)

# 8. Replace invalid zeros with NA
for (col in columns_to_clean) {
  diabetes_clean[diabetes_clean[[col]] == 0, col] <- NA
}

# 9. Check missing values
colSums(is.na(diabetes_clean))

# 10. Check duplicate records
sum(duplicated(diabetes_clean))

# 11. Save the cleaned dataset
write.csv(
  diabetes_clean,
  "data/diabetes_clean.csv",
  row.names = FALSE
)

# 12. Check final dataset dimensions
dim(diabetes_clean)
