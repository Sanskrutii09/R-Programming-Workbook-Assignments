#workbook assignment assignment 1

#question 1
a <- as.numeric(readline("enter first number: "))
b <- as.numeric(readline("enter second number: "))

sum_val <- a + b
diff_val <- a - b
prod_val <- a * b
div_val <- a / b
power_val <- a ^ b
mod_val <- a %% b

result <- c(sum_val, diff_val, prod_val, div_val, power_val, mod_val)

print(result)

cat("Maximum =", max(result), "\n")
cat("Minimum =", min(result), "\n")
cat("Average =", mean(result), "\n")


#Question 2
n <- as.numeric(readline("enter how many numbers: "))

#validation check
if(is.na(n) || n <= 0) {
  stop("invalid input.please enter a valid positive number.")
}else{nums <- sample(1:100,n)}

sqrt_val<- sqrt(nums)
round_val <- round(sqrt_val, 2)
ceil_val <- ceiling(sqrt_val)
floor_val <- floor(sqrt_val)


df <- data.frame(
  Numbers = nums,
  SquareRoot = sqrt_val,
  Rounded = round_val,
  ceilling = ceil_val,
  floor = floor_val
)

print(df)


#Question 3

n <- as.numeric(readline("Enter number of names: "))
names <- character(n)
for(i in 1:n){
  names[i] <- readline(paste("Enter name",i,":"))
}
upper_names <- toupper(names)
lengths <- nchar(upper_names)
result <- paste("Name:", upper_names, "- Length:", lengths)
print(result)



#Question 4

nums <- 1:200
filtered <- nums[nums%%3 == 0 & nums%%5 == 0]
square_root <- sqrt(filtered)
square_val <- filtered^2


result <- data.frame(
  Number = filtered,
  SquareRoot = square_root,
  Square = square_val
)

print(result)





# Question 5

a <- as.numeric(readline("Enter a: "))
b <- as.numeric(readline("Enter b: "))
c <- as.numeric(readline("Enter c: "))

D <- b^2 - 4*a*c

if (D > 0) {
  
  root1 <- (-b + sqrt(D)) / (2*a)
  root2 <- (-b - sqrt(D)) / (2*a)
  
  cat("Root 1 =", root1, "\n")
  cat("Root 2 =", root2, "\n")
  
} else if (D == 0) {
  
  root <- -b / (2*a)
  
  cat("Equal Root =", root, "\n")
  
} else {
  
  cat("Complex Roots\n")
  
}

