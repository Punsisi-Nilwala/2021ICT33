# Statistical Analysis

# 1. Import cleaned dataset
diabetes_clean <- read.csv("data/diabetes_clean.csv")

# 2. Compare mean glucose levels
aggregate(
  Glucose ~ Outcome,
  data = diabetes_clean,
  FUN = mean,
  na.rm = TRUE
)

# 3. Perform Welch Two-Sample t-test
glucose_test <- t.test(
  Glucose ~ Outcome,
  data = diabetes_clean
)

# 4. Display test results
print(glucose_test)


# 5. Save Statistical Test Results

capture.output(
  glucose_test,
  file = "results/glucose_t_test.txt"
)

# 6. Logistic Regression Model

diabetes_model <- glm(
  Outcome ~ Glucose + BMI + Age + Pregnancies,
  data = diabetes_clean,
  family = binomial
)

# 7. Display Model Summary
summary(diabetes_model)

# 8. Save Model Results
capture.output(
  summary(diabetes_model),
  file = "results/logistic_regression.txt"
)


# 7. Display Model Coefficients

coefficients <- coef(diabetes_model)

print(coefficients)

# 8. Save Model Coefficients

write.csv(
  coefficients,
  "results/logistic_regression_coefficients.csv"
)



# 9. Evaluate Logistic Regression Model

# Select complete records
model_data <- na.omit(
  diabetes_clean[, c(
    "Outcome",
    "Glucose",
    "BMI",
    "Age",
    "Pregnancies"
  )]
)

# Generate predictions
predicted_prob <- predict(
  diabetes_model,
  newdata = model_data,
  type = "response"
)

# Convert probabilities into classes
predicted_class <- ifelse(predicted_prob >= 0.5, 1, 0)

# Create confusion matrix
confusion_matrix <- table(
  Actual = model_data$Outcome,
  Predicted = predicted_class
)

print(confusion_matrix)

# Calculate accuracy
accuracy <- mean(
  predicted_class == model_data$Outcome
) * 100

print(paste("Model Accuracy:", round(accuracy, 2), "%"))

# Save results
capture.output(
  list(
    Confusion_Matrix = confusion_matrix,
    Accuracy = accuracy
  ),
  file = "results/model_evaluation.txt"
)



# 10. Train-Test Split Evaluation

set.seed(123)

# Split data into 80% training and 20% testing
train_indices <- sample(
  seq_len(nrow(model_data)),
  size = floor(0.8 * nrow(model_data))
)

train_data <- model_data[train_indices, ]
test_data <- model_data[-train_indices, ]

# Train a new model using training data
test_model <- glm(
  Outcome ~ Glucose + BMI + Age + Pregnancies,
  data = train_data,
  family = binomial
)

# Predict outcomes for testing data
test_prob <- predict(
  test_model,
  newdata = test_data,
  type = "response"
)

test_class <- ifelse(test_prob >= 0.5, 1, 0)

# Create test confusion matrix
test_confusion <- table(
  Actual = test_data$Outcome,
  Predicted = test_class
)

print(test_confusion)

# Calculate test accuracy
test_accuracy <- mean(
  test_class == test_data$Outcome
) * 100

print(paste(
  "Test Accuracy:",
  round(test_accuracy, 2),
  "%"
))

# Save test results
capture.output(
  list(
    Confusion_Matrix = test_confusion,
    Test_Accuracy = test_accuracy
  ),
  file = "results/test_evaluation.txt"
)
