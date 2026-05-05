#Workbook Assignment 2

set.seed(123) 

sales_data <- data.frame( 
  OrderID = 1:100, 
  CustomerName = sample(c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),100,replace=TRUE), 
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),100,replace=TRUE), 
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),100,replace=TRUE), 
  Category = sample(c("Electronics","Fashion"),100,replace=TRUE), 
  Quantity = sample(1:10,100,replace=TRUE), 
  Price = sample(seq(500,50000,500),100,replace=TRUE), 
  Discount = sample(c(0,5,10,15,20),100,replace=TRUE), 
  PaymentMethod = sample(c("Cash","Card","UPI"),100,replace=TRUE) 
) 

sales_data$Revenue <- sales_data$Quantity * sales_data$Price 
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount / 100 
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount 

head(sales_data) 


#Question 1

#Show orders where Price > 20000. 
sales_data[sales_data$prive>20000, ]

#Show orders where City = Pune. 
sales_data[sales_data$city == "Pune",]

#Show orders where Quantity > 5. 
sales_data[sales_data$Quantity >5,]

#Show orders where Category = Electronics. 
sales_data[sales_data$Category == "electronics",]

#Combine two conditions. 
sales_data[sales_data$price > 20000 & sales_data$City == "Pune",]

#Question 2
#Q2) Sorting Data 

#Sort dataset by Price. 
sales_data[order(sales_data$Price),]

#Sort dataset by Revenue. 
sales_data[order(sales_data$Revenue),]

#Sort by City alphabetically. 
sales_data[order(sales_data$City),]

#Sort by Quantity descending. 
sales_data[order(-sales_data$Quantity),]

#Sort by multiple columns. 
sales_data[order(sales_data$City, -sales_data$Revenue),]


#Questionn3
#Q3) Aggregation 

#Total revenue by city. 
aggregate(Revenue ~ City, sales_data, sum)

#Average price by category. 
aggregate(Price ~ Category, sales_data, mean)

#Total quantity sold by product.
aggregate(Quantity ~ Product, sales_data, sum)

#Maximum order value by city. 
aggregate(Revenue ~ City, sales_data, max)

#Minimum order value by product. 
aggregate(Revenue ~ Product, sales_data, min)


#Question4
#Q4) Conditional Statements

#1. If discount > 10 mark "High Discount". 
sales_data$DiscountFlag <- ifelse(sales_data$Discount >10, "High Discount","Normal")
sales_data$DiscountFlag

#2. Classify orders into High / Medium / Low value by using if else. 
sales_data$OrderCategory <- ifelse(sales_data$Revenue > 30000, "High", 
                            ifelse(sales_data$Revenue > 10000, "Medium", "Low"))
sales_data$OrderCategory 

#3. Print revenue of each order by using for loop. 
for(i in 1:nrow(sales_data)){
  print(sales_data$Revenue[i])
}


#4. Calculate cumulative revenue by using while loop 
i <- 1
total <- 0

while(i <= nrow(sales_data)){
  total <- total + sales_data$Revenue[i]
  i <- i+1
}
print (total)

#5. Skip fashion category. 
sales_data[sales_data$Category != "fashion",]


#Question 5
#Q5) Discount Analysis 

#Find Average discount.
mean(sales_data$Discount)

#Orders with discount > 10%. 
sales_data[sales_data$Discount >10, ]

#Total discount amount. 
sum(sales_data$DiscountAmount)

#City with highest discount. 
aggregate(DiscountAmount ~ City, sales_data, sum)

#Count discount levels. 
table(sales_data$Discount)


#Question 6
#Q6) Multi Condition Filtering 

#Electronics + Price > 20000 
sales_data[sales_data$Category == "Electronics" & sales_data$Price > 20000,]

#Fashion + Quantity > 5 
sales_data[sales_data$Category == "fashion" & sales_data$Quantity > 5, ]

#Pune + Discount > 10 
sales_data[sales_data$City == "Pune" & sales_data$Discount > 10, ]

#Revenue > 50000 + Cash payment 
sales_data[sales_data$Revenue > 50000 & sales_data$PaymentMethod == "Cash",]

#High price + high quantity 
sales_data[sales_data$Price > 30000 & sales_data$Quantity >5, ]
