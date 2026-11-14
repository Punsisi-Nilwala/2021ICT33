
# Bioinformatics ICA 3
# Exploratory Data Analysis (EDA)

# 1. Import cleaned dataset
diabetes_clean <- read.csv("data/diabetes_clean.csv")

# 2. Check dataset dimensions
dim(diabetes_clean)

# 3. Count diabetes and non-diabetes patients
table(diabetes_clean$Outcome)

# 4. Calculate percentages
prop.table(table(diabetes_clean$Outcome)) * 100



# 5. Visualize diabetes outcome distribution

outcome_counts <- table(diabetes_clean$Outcome)

barplot(
  outcome_counts,
  names.arg = c("No Diabetes", "Diabetes"),
  col = c("skyblue", "salmon"),
  main = "Distribution of Diabetes Outcomes",
  xlab = "Diabetes Status",
  ylab = "Number of Patients"
)



# 6. Visualize Glucose Distribution

hist(
  diabetes_clean$Glucose,
  main = "Distribution of Glucose Levels",
  xlab = "Glucose Level",
  ylab = "Frequency",
  col = "lightgreen",
  border = "black"
)



# 7. Compare Glucose Levels by Diabetes Status

boxplot(
  Glucose ~ Outcome,
  data = diabetes_clean,
  names = c("No Diabetes", "Diabetes"),
  main = "Glucose Levels by Diabetes Status",
  xlab = "Diabetes Status",
  ylab = "Glucose Level",
  col = c("skyblue", "salmon")
)



# 8. Visualize BMI Distribution

hist(
  diabetes_clean$BMI,
  main = "Distribution of BMI",
  xlab = "Body Mass Index (BMI)",
  ylab = "Frequency",
  col = "lightblue",
  border = "black"
)


# 9. Correlation Analysis

numeric_data <- diabetes_clean[
  sapply(diabetes_clean, is.numeric)
]

correlation_matrix <- cor(
  numeric_data,
  use = "pairwise.complete.obs"
)

print(correlation_matrix)



# 10. Correlation Heatmap

heatmap(
  correlation_matrix,
  main = "Correlation Heatmap of Diabetes Dataset",
  col = colorRampPalette(c("blue", "white", "red"))(100),
  scale = "none",
  margins = c(10, 10)
)


# 11. Save EDA Graphs

# Save Outcome Distribution
png("figures/outcome_distribution.png")
barplot(
  table(diabetes_clean$Outcome),
  names.arg = c("No Diabetes", "Diabetes"),
  col = c("skyblue", "salmon"),
  main = "Distribution of Diabetes Outcomes",
  xlab = "Diabetes Status",
  ylab = "Number of Patients"
)
dev.off()

# Save Glucose Histogram
png("figures/glucose_distribution.png")
hist(
  diabetes_clean$Glucose,
  main = "Distribution of Glucose Levels",
  xlab = "Glucose Level",
  col = "lightgreen"
)
dev.off()