# AIM:
# 1. Performing Logistic Regression using glm() in R
# 2. Importing dataset and exporting results using write.csv()
# Dataset: Customer Purchase Data (Kaggle)

# Step 1: Import dataset
data <- read.csv("synthetic_customer_purchase_data_random_purchase.csv")

# Step 2: View dataset
head(data)
str(data)
summary(data)

# Step 3: Convert categorical variables to factors
data$Gender <- as.factor(data$Gender)
data$Marital_Status <- as.factor(data$Marital_Status)
data$Education_Level <- as.factor(data$Education_Level)

# Step 4: Convert target variable to factor
data$Purchase <- as.factor(data$Purchase)

# Step 5: Build Logistic Regression Model
model <- glm(Purchase ~ Age + Income + Gender + Marital_Status +
               Education_Level + Product_Interest,
             data = data,
             family = binomial)

# Step 6: Model summary
summary(model)

# Step 7: Predict probabilities
predicted_prob <- predict(model, type = "response")

# Step 8: Convert probabilities into class labels
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)

# Step 9: Create results dataframe
results <- data.frame(
  Actual = data$Purchase,
  Predicted = predicted_class,
  Probability = predicted_prob
)

# Step 10: View results
head(results)

# Step 11: Export results to CSV
write.csv(results,
          "Logistic_Regression_Customer_Purchase_Results.csv",
          row.names = FALSE)

