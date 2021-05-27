  # Set parameters
  bounds <- c(0, 30)
  ncam <- 10
  max.steps <- 1000
  theta <- 42/360 * 2 * pi # In radians
  r <- 1
  
  library(tidyverse)
  
  # Redo simulation with exact step lengths
  rw <- function(bounds, max.steps, steplen) {
    # Creates a random walk for one individual, that stays within the bounds
    
    X <- rep(NA, max.steps)
    Y <- rep(NA, max.steps)
    
    # Start in a random place on the board (not within 1 unit of the border)
    #   This ensures that at least the first step is legal so the while loop will work
    X[1] <- sample((min(bounds)+1):(max(bounds)-1), 1)
    Y[1] <- sample((min(bounds)+1):(max(bounds)-1), 1)
    
    for(i in 2:(max.steps)) {
      # Exact step lengths
      step <- steplen
      
      # Truly completely random turning angles
      theta <- runif(1, 0, 2*pi)
      
      # Step length components
      dX <- step*cos(as.numeric(theta))
      dY <- step*sin(as.numeric(theta))
      
      # Make sure those are legal or turn it around
      if ((X[i-1] + dX) < max(bounds) & (X[i-1] + dX) > min(bounds)){
        X[i] <- X[i-1] + dX
      } else {
        X[i] <- X[i-1] - dX
      }
      if ((Y[i-1] + dY) < max(bounds) & (Y[i-1] + dY) > min(bounds)) {
        Y[i] <- Y[i-1] + dY
      } else {
        Y[i] <- Y[i-1] - dY
      }
    }
    out <- data.frame(X = X, Y = Y)
    return(out)
  }
  
  # Random cameras
  cam.df <- tibble(cam = 1:ncam) %>%
    rowwise() %>% # If not rowwise, there's only one value from runif
    mutate(camx = runif(1, min(bounds), max(bounds)),
           camy = runif(1, min(bounds), max(bounds)),
           camdir = runif(1, 0, 2*pi),
           camdir_deg = camdir*360/(2*pi),
           camdir_deg_end = (camdir + theta)*360/(2*pi)
    ) %>%
    ungroup()
  
  s <- rw(
        bounds = bounds,
        max.steps = max.steps,
        steplen = 0.5)
  
  plot(s, type = "l", xlim = bounds, ylim = bounds)
  for(i in 1:ncam){
    circlize::draw.sector(cam.df$camdir_deg[i], 
                          cam.df$camdir_deg_end[i], 
                          center = c(cam.df$camx[i], cam.df$camy[i]), 
                          rou1 = r, 
                          border = "red", 
                          clock.wise = F) 
  }
