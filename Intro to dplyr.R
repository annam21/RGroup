  install.packages("dplyr")
  install.packages("tidyverse")
  
  
  iris2 <- tbl_df(iris)
  print(iris2, n = 20)
  
  # Problem 1. 
  # Just look at species virginica
  iris[iris$Species == "virginica"|iris$Species == "setosa", ]
  
  
  filter(iris, 
         Species %in% c("virginica", "setosa") )
  
  # Problem 2. # Just columns Species and petal length
  tst <- iris[, c("Species", "Petal.Length")]
  tst <- iris[, c(5, 3)]
  
  
  tst <- select(iris, Species, Petal.Length)
  select(iris, 5, 3 )
  
  # Make a new column, sepal.area
  iris$Sepal.Area <- iris$Sepal.Length * iris$Sepal.Width
  
  iris2 <- mutate(iris, Sepal.Area = Sepal.Length * Sepal.Width)
  
  
  # Put them together
  # Get a data frame of just Species setosa, just columns species, sepal.length,
  # sepal.width, then calculate sepal.area
  iris2 <- iris[iris$Species == "virginica"|iris$Species == "setosa", ]
  iris3 <- iris2[, c("Species", "Petal.Length")]
  iris3$Sepal.Area <- iris3$Sepal.Length * iris3$Sepal.Width
  
  iris2 <- iris %>%
    filter(Species == "setosa") %>%
    select(Species, Sepal.Length, Sepal.Width) %>%
    mutate(Sepal.Area = Sepal.Length * Sepal.Width)
  
  iris2 <- iris %>%
    group_by(Species) %>% 
    summarize(Mean.sep.width = mean(Sepal.Width))
  
  
  
  
  data.frame("treatment" = c("control", "pesticide"),
             "Dec.2017" = c(0.4, 0.7),
             "Feb.2018" = c(0.5, 0.3),
             "Apr.2018" = c(0.4, .09))
  
  
