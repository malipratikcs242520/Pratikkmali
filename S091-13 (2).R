# AIM:
# 1. Performing linear regression analysis using lm() in R
# 2. Exporting results into external files (Excel, CSV, PDF)
#    using write.csv() and writexl

options(scipen = 999)

# Step 1: Load dataset
data <- read.csv("Housing.csv")

# Step 2: View dataset
head(data)
str(data)
summary(data)

# Step 3: Scatter plot (Area vs Price)
plot(data$area, data$price,
     xlab = "House Area",
     ylab = "House Price",
     main = "House Price vs Area")

# Step 4: Linear regression model
model <- lm(price ~ area, data = data)

# Step 5: Model summary
summary(model)

# Step 6: Draw regression line
plot(data$area, data$price,
     xlab = "House Area",
     ylab = "House Price",
     main = "Linear Regression: Price vs Area")

abline(model, col = "red", lwd = 2)

# Step 7: Predict house prices
predicted_price <- predict(model, newdata = data)

# Step 8: View predicted prices
head(predicted_price)

# Step 9: Combine actual and predicted values
results <- data.frame(
  Area = data$area,
  Actual_Price = data$price,
  Predicted_Price = predicted_price
)

# Step 10: Export results to CSV file
write.csv(results, "House_Price_Predictions.csv", row.names = FALSE)

# Step 11: Export results to Excel file
# Install writexl package if not already installed
# install.packages("writexl")

library(writexl)
write_xlsx(results, "House_Price_Predictions.xlsx")

# Step 12 (Optional): Export plot to PDF
pdf("House_Price_Regression_Plot.pdf")
plot(data$area, data$price,
     xlab = "House Area",
     ylab = "House Price",
     main = "House Price vs Area")
abline(model, col = "red", lwd = 2)
dev.off()
