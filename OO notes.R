  #' OO programing RGroup
  #' 3/2/2018
  #' 
  #' Talk about attributes
  #' names(x), dim(x), and class(x),
  #' attributes(x)
  #' attr(x)
  #' 
  #' What were the takeaways?
  #' Why would you used OOP? 
  #' What are examples of OOP? 
  #' interesting takeaway: dplyr style _ vs . 
  ?print
  
  library(sf)
  ?help(package = sf)
  ?filter.sf
  ?sf::plot
  
  x <- lm(mpg~cyl, data = mtcars)
  x 
  str(x)
  attributes(x)
  attributes(x)$names
  attr(x, "names")  
  str(attributes(x))  
  names(x)
  class(x)
  
  # UseMethod
  abc <- structure(list(), class = "a")
  class(abc)
  
  f.a <- function(x){
    "printing whatever I tell it to if the class is 'a' "
  }
  f(abc)  

  # Have to define f first!
  f <- function(x){
    UseMethod("f")
  }
  
  f(abc)
  
  def <- structure(list(), class = "b")
  f(def)
    
  # Very behind the scenes
  filter
  filter.sf  
  