  # Introduction to R
  # Anna Moeller 
  # 10/25/2018

  # What can you do with R?
  # RMarkdown, GIS for free! data cleanup, any statistical analysis ever,
  # Make maps, download collar data automatically
  # http://rspatial.org/rs/rst/3-basicmath.html 
  # Simulate data: cool things to do in R

# Email Alex or Anna
# alexander.kumar@umontana.edu
# anna.moeller@umontana.edu

  ### Terminology
  # Comment sign
  # functions
  lm()
  # objects
  myobj <- c(1,4,35,2)
  mine <- c("ab", "this is character", "bob")
  # vectors (types)
  # data.frames 
  

  # Play with iris: look at it, plot things 

#####################################
  # baseR
  # packages

  # Install a package
  install.packages("RXKCD")
  
  # Where are your packages installed? 
  installed.packages()
  
  # Use that package
  library(RXKCD) # Notice: no quotes
  getXKCD()
  

#####################################
  # How to clean, subset data
  
  # Working directory
  getwd()
  write.csv(iris, "Introduction to R/iris.csv")
  
  # Bring in your data 
  ### call it something! 
  data <- read.csv("Introduction to R/iris.csv")
  
  # Install dplyr
  install.packages("dplyr")
  
  # Load dplyr
  library(dplyr)
  
  # Problem 1. 
  # Just look at species virginica
  filter(data, Species == "virginica")
  
  # Problem 2. Just look at columns Species and Petal.Length
  select(data, Species, Petal.Length)

  # Problem 3. Make a new column, sepal.area
  mutate(data, Sepal.area = Sepal.Length * Sepal.Width)
  
  # Problem 4. Put it all together
  mutate(data, Sepal.area = Sepal.Length * Sepal.Width) %>%
    select(Species, Sepal.area) %>%
    filter(Species == "virginica")
  
  # Problem 5. Summarize
  data %>%
    group_by(Species) %>%
    summarize(Mean.sepal = mean(Sepal.Length))
  
#######################################
  # What to do with error messages
  a <- c(1, 4, 6, 2, 6)
  a + b
  
  my.fn(5)
  my.fn <- function(x){
    x + 3
  }
  myfn(5)
  
  # Class mismatch error
  b <- c("Anna", "Jenny", "Molly", "Kelsey")
  a + b
  
  # Punctuation errors
  head(a))
  
  c <- NULL
  for(i in 1:length(a){
    c[i] <- a[i] + 3
  }
  
  # Function not found
  here()
  
  
  