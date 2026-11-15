# Diabetes Prediction Using Clinical Data: An Exploratory and Statistical Analysis

## Abstract

Diabetes is a major health concern that requires early identification and effective management. This project explores clinical data to identify patterns associated with diabetes and investigate whether selected health measurements can help predict diabetes status. The Pima Indians Diabetes Dataset, containing 768 records and nine variables, was used for the analysis. Data preprocessing was performed by treating invalid zero values in selected clinical measurements as missing values. Exploratory data analysis, correlation analysis, a Welch two-sample t-test, and logistic regression were conducted using R. The results showed that the mean glucose level was significantly higher among individuals with diabetes. A logistic regression model achieved 76.16% accuracy on the test dataset. These findings demonstrate the usefulness of clinical data analysis while highlighting the need for further validation.

## 1. Introduction

### 1.1 Background

Diabetes mellitus is a chronic disease that affects how the human body regulates blood glucose levels. Early identification of diabetes is important because timely medical attention and appropriate lifestyle changes can help reduce the risk of serious health complications.

Healthcare datasets contain valuable information that can be analysed to understand patterns related to diseases. Bioinformatics and data analysis techniques help researchers explore these datasets, identify relationships between clinical measurements, and develop predictive models.

This project uses the Pima Indians Diabetes Dataset to investigate the relationship between selected clinical measurements and diabetes status. The dataset includes variables such as glucose level, blood pressure, body mass index (BMI), insulin level, age, and number of pregnancies.

### 1.2 Problem Statement

Identifying individuals who may have diabetes using clinical measurements is an important healthcare challenge. However, clinical datasets may contain missing or invalid values, and different health measurements may have different relationships with diabetes status.

Therefore, this project focuses on exploring clinical data, identifying important patterns, and evaluating whether a statistical prediction model can classify diabetes status.

### 1.3 Aim and Objectives

The main aim of this project is to analyse clinical data and investigate the use of statistical methods for diabetes prediction.

The specific objectives are:

- To import and understand the Pima Indians Diabetes Dataset.
- To identify and handle invalid zero values in selected clinical measurements.
- To explore the distribution of clinical variables using descriptive statistics and visualisations.
- To investigate relationships between clinical measurements and diabetes status.
- To compare glucose levels between diabetic and non-diabetic groups using a statistical test.
- To develop a logistic regression model to predict diabetes status.
- To evaluate the predictive performance of the model using a separate test dataset.

### 1.4 Research Questions

This project addresses the following research questions:

1. How is diabetes status distributed within the selected dataset?
2. Are glucose levels significantly different between diabetic and non-diabetic individuals?
3. Which clinical measurements show relationships with diabetes status?
4. How accurately can logistic regression predict diabetes status using selected clinical variables?

### 1.5 Scope of the Study

This study focuses on exploratory and statistical analysis of the Pima Indians Diabetes Dataset using the R programming language. It includes data cleaning, exploratory data analysis, correlation analysis, hypothesis testing, logistic regression, and model evaluation.

The project is an academic data analysis exercise. The prediction model is not intended to replace professional medical diagnosis.

## 2. Data Description

### 2.1 Dataset Overview

This project uses the Pima Indians Diabetes Dataset, a publicly available clinical dataset commonly used for diabetes-related data analysis and prediction studies.

The dataset contains 768 observations and 9 variables. Each observation represents a patient record. The target variable, Outcome, indicates whether the individual has diabetes.

Dataset source:

https://raw.githubusercontent.com/npradaschnor/Pima-Indians-Diabetes-Dataset/master/diabetes.csv

### 2.2 Dataset Variables

The dataset contains the following variables:

| Variable | Description |
|---|---|
| Pregnancies | Number of times the patient has been pregnant |
| Glucose | Plasma glucose concentration |
| BloodPressure | Diastolic blood pressure |
| SkinThickness | Triceps skin fold thickness |
| Insulin | Two-hour serum insulin |
| BMI | Body Mass Index |
| DiabetesPedigreeFunction | A function representing diabetes history information |
| Age | Age of the patient in years |
| Outcome | Diabetes status (0 = Non-diabetic, 1 = Diabetic) |

### 2.3 Dataset Characteristics

The original dataset contains 768 records and 9 columns. The Outcome variable is used as the target variable for classification.

The dataset includes both numerical clinical measurements and a binary target variable. These characteristics make it suitable for exploratory data analysis, statistical testing, correlation analysis, and logistic regression.

### 2.4 Data Limitations

Some clinical measurements contain zero values that may represent missing or unrecorded information rather than actual measurements. In particular, zero values in Glucose, BloodPressure, SkinThickness, Insulin, and BMI were treated as missing values during preprocessing.

However, zero values in Pregnancies and Outcome are valid observations and were retained.

The dataset represents a specific population and may not represent all populations equally. Therefore, the findings should be interpreted with this limitation in mind.

## 3. Methods and Materials

### 3.1 Tools and Technologies

The analysis was conducted using the R programming language. RStudio was used as the development environment.

The following R functions and packages were used:

| Tool / Function | Purpose |
|---|---|
| R | Data analysis and statistical computing |
| RStudio | Development environment |
| read.csv() | Importing CSV data |
| summary() | Generating descriptive statistics |
| is.na() | Identifying missing values |
| barplot() | Visualising categorical data |
| hist() | Visualising numerical distributions |
| boxplot() | Comparing distributions between groups |
| cor() | Calculating correlations |
| t.test() | Performing a statistical hypothesis test |
| glm() | Building a logistic regression model |
| predict() | Generating model predictions |

### 3.2 Data Importing

The original dataset was downloaded in CSV format and stored in the data directory.

The dataset was imported into R using the read.csv() function. Initial inspection was performed using functions such as dim(), str(), head(), and summary() to understand its dimensions, structure, and statistical characteristics.

### 3.3 Data Preprocessing

Data preprocessing was performed to improve data quality before conducting the analysis.

The following steps were completed:

1. Imported the original CSV dataset into R.
2. Checked the dimensions and variable types.
3. Identified zero values in selected clinical measurements.
4. Replaced zero values with NA in Glucose, BloodPressure, SkinThickness, Insulin, and BMI.
5. Retained valid zero values in Pregnancies and Outcome.
6. Checked the number of missing values in each variable.
7. Checked for duplicate records without automatically deleting them.
8. Saved the cleaned dataset as diabetes_clean.csv inside the data directory.

### 3.4 Exploratory Data Analysis

Exploratory Data Analysis (EDA) was conducted to understand the distribution of diabetes status and clinical measurements.

The following visualisations were created:

- Bar chart to show the distribution of diabetic and non-diabetic individuals.
- Histogram to examine the distribution of glucose levels.
- Boxplot to compare glucose levels between diabetes groups.
- Histogram to examine BMI distribution.
- Correlation matrix and heatmap to explore relationships between numerical variables.

These visualisations helped identify patterns and possible relationships within the dataset.

### 3.5 Statistical Analysis

A Welch two-sample t-test was performed to compare the mean glucose levels of diabetic and non-diabetic individuals.

The hypotheses were:

- Null hypothesis (H0): There is no significant difference in mean glucose levels between the two groups.
- Alternative hypothesis (H1): There is a significant difference in mean glucose levels between the two groups.

A significance level of 0.05 was used.

### 3.6 Logistic Regression

Logistic regression was selected because the target variable, Outcome, is binary.

The model used the following predictor variables:

- Glucose
- BMI
- Age
- Pregnancies

The model was trained using the training dataset and used to predict diabetes status in the test dataset.

### 3.7 Model Evaluation

The dataset was divided into training and testing subsets using an 80:20 split. A random seed of 123 was used to support reproducibility.

Model performance was evaluated using:

- Accuracy
- Confusion matrix
- Correctly classified positive and negative cases
- Incorrectly classified cases

The test dataset was kept separate from model training to provide an estimate of performance on unseen records.

## 4. Results

### 4.1 Diabetes Outcome Distribution

The original dataset contained 768 patient records. Among these records, 500 individuals (65.10%) were classified as non-diabetic, while 268 individuals (34.90%) were classified as diabetic.

This indicates that the dataset contains more non-diabetic observations than diabetic observations.

### 4.2 Data Preprocessing Results

Zero values in Glucose, BloodPressure, SkinThickness, Insulin, and BMI were replaced with missing values (NA). This preprocessing step helped avoid treating invalid measurements as actual clinical values.

The cleaned dataset was saved as diabetes_clean.csv for subsequent analysis.

### 4.3 Exploratory Data Analysis

The visualisations showed differences in clinical measurements between the two diabetes groups.

The glucose distribution and boxplot indicated that individuals with diabetes generally had higher glucose levels than individuals without diabetes.

The correlation analysis also identified several relationships with the Outcome variable:

| Variable | Correlation with Outcome |
|---|---:|
| Glucose | 0.495 |
| BMI | 0.314 |
| Insulin | 0.303 |
| Age | 0.238 |
| Pregnancies | 0.222 |

Glucose showed the strongest positive correlation with diabetes status among the listed variables. BMI and insulin also showed positive relationships, although they were weaker.

These correlations indicate associations and do not establish cause-and-effect relationships.

### 4.4 Statistical Test Results

A Welch two-sample t-test was conducted to compare glucose levels between diabetic and non-diabetic individuals.

The mean glucose level among non-diabetic individuals was approximately 110.64, while the mean glucose level among diabetic individuals was approximately 142.32.

The test produced the following results:

- t-statistic: -14.884
- Degrees of freedom: 466.02
- p-value: less than 2.2 × 10⁻¹⁶
- 95% confidence interval for the mean difference: -35.86 to -27.49

Since the p-value is considerably smaller than 0.05, the null hypothesis was rejected.

Therefore, there is a statistically significant difference in mean glucose levels between diabetic and non-diabetic groups. The diabetic group had a higher mean glucose level.

### 4.5 Logistic Regression Results

A logistic regression model was developed using Glucose, BMI, Age, and Pregnancies as predictor variables.

The estimated model coefficients were:

| Variable | Coefficient |
|---|---:|
| Intercept | -9.0361 |
| Glucose | 0.0362 |
| BMI | 0.0912 |
| Age | 0.0120 |
| Pregnancies | 0.1093 |

The positive coefficients indicate that higher values of these predictors are associated with higher estimated log-odds of diabetes, when the other predictors are held constant.

### 4.6 Model Evaluation

The model was evaluated using an 80:20 training and testing split.

The test dataset produced an accuracy of 76.16%.

The confusion matrix was:

| Actual Class | Predicted Non-diabetic | Predicted Diabetic |
|---|---:|---:|
| Non-diabetic | 81 | 15 |
| Diabetic | 21 | 34 |

The model correctly classified 81 non-diabetic individuals and 34 diabetic individuals.

It incorrectly classified 15 non-diabetic individuals as diabetic and 21 diabetic individuals as non-diabetic.

Overall, the results indicate that logistic regression can provide a useful baseline for diabetes classification using the selected clinical measurements.

## 5. Discussion

The analysis provided several useful findings about the relationship between clinical measurements and diabetes status in the Pima Indians Diabetes Dataset.

The outcome distribution showed that approximately 65.10% of the individuals were non-diabetic, while 34.90% were diabetic. This indicates an imbalance between the two outcome classes, which should be considered when evaluating the classification model.

The exploratory analysis showed that glucose levels were generally higher among individuals with diabetes. This finding was supported by the Welch two-sample t-test, which identified a statistically significant difference between the mean glucose levels of the two groups.

Correlation analysis showed that glucose had the strongest positive correlation with diabetes status among the selected variables. BMI, insulin, age, and pregnancies also showed positive correlations. However, correlation does not prove that a variable causes diabetes.

The logistic regression model achieved 76.16% accuracy on the test dataset. This suggests that the selected clinical measurements provide useful information for distinguishing between diabetic and non-diabetic individuals.

However, the confusion matrix showed that the model incorrectly classified 21 diabetic individuals as non-diabetic. Such false-negative predictions are important in healthcare because they may result in individuals with diabetes being overlooked.

The model also had limitations. It used only four predictor variables, and its performance was evaluated using a single train-test split. Further evaluation using cross-validation, additional clinical variables, and other machine learning algorithms could provide a more reliable assessment.

Therefore, the model should be considered an academic predictive analysis rather than a clinical diagnostic tool.

## 6. Conclusion and Future Work

### 6.1 Conclusion

This project analysed the Pima Indians Diabetes Dataset to explore clinical measurements associated with diabetes and evaluate a logistic regression model for diabetes prediction.

The analysis included data preprocessing, exploratory data analysis, correlation analysis, hypothesis testing, and predictive modelling using R.

The results showed that individuals with diabetes had significantly higher mean glucose levels than non-diabetic individuals. Glucose also showed the strongest positive correlation with diabetes status among the selected variables.

The logistic regression model achieved 76.16% accuracy on the test dataset. This demonstrates that statistical modelling can provide useful insights into diabetes classification using clinical measurements.

Overall, the project achieved its main objectives and provided practical experience in applying bioinformatics and statistical data analysis techniques to a healthcare dataset.

### 6.2 Future Work

Several improvements can be considered for future research:

- Include additional relevant clinical and demographic variables.
- Investigate different missing-value imputation techniques.
- Compare logistic regression with decision trees, random forests, and support vector machines.
- Apply cross-validation to obtain more reliable performance estimates.
- Evaluate additional metrics such as precision, recall, F1-score, and ROC-AUC.
- Investigate class imbalance handling techniques.
- Validate the model using independent datasets from different populations.

These improvements may help develop more reliable predictive models for academic research.

## 7. Reproducibility

All data analysis and statistical procedures in this project were performed using the R programming language.

The project files are organised into separate directories:

- `data/` – Original and cleaned datasets.
- `code/` – R scripts for preprocessing, exploratory data analysis, and statistical analysis.
- `figures/` – Generated data visualisations.
- `results/` – Statistical test results, regression coefficients, and model evaluation outputs.
- `report/` – Report-related files.

To reproduce the analysis:

1. Clone or download this public GitHub repository.
2. Open the `Bioinformatics_ICA3.Rproj` file using RStudio.
3. Open the R scripts inside the `code/` directory.
4. Run `data_preprocessing.R` first.
5. Run `exploratory_data_analysis.R`.
6. Run `statistical_analysis.R`.

The analysis uses the included CSV datasets and a fixed random seed of 123 for the train-test split. This supports reproducibility of the model evaluation.

GitHub repository:

https://github.com/Punsisi-Nilwala/2021ICT33

## 8. References

1. Smith, J. W., Everhart, J. E., Dickson, W. C., Knowler, W. C., and Johannes, R. S. (1988). Using the ADAP learning algorithm to forecast the onset of diabetes mellitus. *Proceedings of the Annual Symposium on Computer Application in Medical Care*, 261–265.

2. National Institute of Diabetes and Digestive and Kidney Diseases. Pima Indians Diabetes Dataset. Available at: https://raw.githubusercontent.com/npradaschnor/Pima-Indians-Diabetes-Dataset/master/diabetes.csv

3. R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. Available at: https://www.r-project.org/

4. UCLA Institute for Digital Research and Education. Logistic Regression in R. Available at: https://stats.oarc.ucla.edu/r/dae/logit-regression/

5. Wickham, H., Çetinkaya-Rundel, M., and Grolemund, G. (2023). *R for Data Science (2e).* O'Reilly Media. Available at: https://r4ds.hadley.nz/