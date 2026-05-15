df <- data.frame(
  name = c("Raj","Amit", "Neha", "Raj","Amit"),
  marks = c("80", "90", NA, "85", "90"),
  city = c("Pune","pune","Mumbai","PUNE","Mumbai"),
  stringsAsFactors = FALSE
)

# 1. Remove extra spaces from name column
df$name <- trimws(df$name)
df$name

# 2. Convert all names to lowercase
df$name <- tolower(df$name)
df$name

# 3. Convert marks column to numeric
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)
df$marks

# 4. Standardize city names (all lowercase)
df$city <- tolower(df$city)
df$city

# 5. Filter students with marks greater than 80
filtered_students <- df[df$marks > 80, ]
filtered_students

# 6. Create grade column
df$grade <- ifelse(df$marks >= 85, "A", "B")
df$grade

# Print 
print(df)

# Print filtered students
print(filtered_students)