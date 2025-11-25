# Install and load required packages
install.packages("dplyr")   # Run only once
library(dplyr)
library(readr)              # For efficient CSV reading

# Step 1: Read the dataset
delivery <- read_csv("Food_Delivery_Route_Efficiency_Dataset.csv")

# Step 2: Inspect the structure
glimpse(delivery)
head(delivery)

# -------------------------------
# Method 1: Using base R subset()
# -------------------------------

# Example 1: Single Condition
# Filter for deliveries where delivery_time_min > 60 minutes
long_deliveries <- subset(delivery, delivery_time_min > 60)
cat("Number of long deliveries (> 60 min):", nrow(long_deliveries), "\n")
summary(long_deliveries$delivery_time_min)

# Example 2: Multiple Conditions (AND)
# Filter for deliveries where delivery_time_min > 60 AND traffic_level == "High"
long_high_traffic <- subset(delivery, delivery_time_min > 60 & traffic_level == "High")
cat("Number of long deliveries in high traffic:", nrow(long_high_traffic), "\n")
head(long_high_traffic)

# Example 3: Multiple Conditions (OR)
# Filter for deliveries that are either by Bicycle OR have route_length_km > 12
special_deliveries <- subset(delivery, delivery_mode == "Bicycle" | route_length_km > 12)
cat("Number of special deliveries:", nrow(special_deliveries), "\n")
head(special_deliveries)

# -------------------------------
# Method 2: Using dplyr::filter()
# -------------------------------

# Example 1: Single Condition (Using Pipe Operator)
# Filter for deliveries with distance_km < 2
short_distance <- delivery |> 
  filter(distance_km < 2)
cat("Number of short distance deliveries (< 2 km):", nrow(short_distance), "\n")
summary(short_distance$distance_km)

# Example 2: Multiple Conditions (Comma-Separated/AND)
# Filter for deliveries in 'South' restaurant_zone AND weather == "Rainy"
south_rainy <- delivery |> 
  filter(restaurant_zone == "South", weather == "Rainy")
cat("Number of rainy deliveries from South zone:", nrow(south_rainy), "\n")
head(south_rainy)

# Example 3: Checking for Values in a Set (%in%)
# Filter for deliveries where delivery_mode is either Car or Scooter
car_or_scooter <- delivery |> 
  filter(delivery_mode %in% c("Car", "Scooter"))
cat("Number of deliveries by Car or Scooter:", nrow(car_or_scooter), "\n")
table(car_or_scooter$delivery_mode)
