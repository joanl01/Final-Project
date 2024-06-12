pacman::p_load(pwr)
# We are going to do a linear regression of gene expression with the predictors
# concentration, cell age, treatment (two levels), cell type (two levels), and media (two levels).
# We have done a previous study and got an $R^2$ of 0.1 between the predictors and the response level.
# If we want a power of 90% and a significance level of 0.05 how many samples in total do we need?

r_squared <- 0.1 # Calculated R-squared
power <- 0.9    # Desired power
alpha <- 0.05   # significance level

# Want to model concentration, cell age, treatment (two levels), cell type (two levels), and media (two levels).
# There are 5 variables

u <- 5

# Calculate effect size f2
f2 <- r_squared/ (1-r_squared)

# Find required sample size
n <- pwr.f2.test(u = u,f2 = f2, sig.level = alpha, power = power )

#From the output, n = u + v + 1
sample_size <- n$u + n$v +1
sample_size
