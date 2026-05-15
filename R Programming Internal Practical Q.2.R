set.seed(100)

sales <- data.frame(
  product = sample(c("Laptop","Mobile","Tablet"), 50, replace = TRUE),
  city = sample(c("Pune","Mumbai","Delhi"), 50, replace = TRUE),
  quantity = sample(1:5, 50, replace = TRUE),
  price = sample(seq(1000, 50000, 5000), 50, replace = TRUE)
)

# Create Revenue column
sales$Revenue <- sales$quantity * sales$price


# 1. Show records where Revenue > 100000
high_revenue <- sales[sales$Revenue > 100000, ]
high_revenue


# 2. Sort data by Revenue in descending order
sorted_sales <- sales[order(-sales$Revenue), ]
sorted_sales


# 3. Total revenue by city
total_revenue_city <- aggregate(Revenue ~ city, data = sales, sum)
total_revenue_city


# 4. Average price by product
avg_price_product <- aggregate(price ~ product, data = sales, mean)
avg_price_product


# 5. Identify product with highest total revenue
product_revenue <- aggregate(Revenue ~ product, data = sales, sum)

product_revenue


# Product with highest total revenue
top_product <- product_revenue[which.max(product_revenue$Revenue), ]
top_product