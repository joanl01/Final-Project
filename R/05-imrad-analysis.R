# Load the required packages
pacman::p_load(tidyverse, lme4, gt, readr, lmerTest, gtsummary)

# Load the cleaned data
df <- read_csv(here::here("data/2024-03-05-gene-data.csv"))

# Fit the mixed-effects model
model <- lmer(gene_expression ~ treatment * conc * cell_line + (1 | name), data = df)

# Get the summary of the model
model_summary <- summary(model)

# Extract the coefficients and p-values
coeffs <- coef(model_summary)
p_values <- coef(summary(model))[, "Pr(>|t|)"]
p_values
# Combine coefficients and p-values into a data frame
results <- cbind(coeffs, "p value" = p_values)
results_df <- as.data.frame(results)
# Remove the original `Pr(>|t|)` and df column
results_df$`Pr(>|t|)` <- NULL
results_df$df <- NULL
# Add the row names (predictors) as a column
results_df <- results_df %>%
  rownames_to_column(var = "Predictor")

# Create a gt table
results_table <- gt(results_df) %>%
  tab_header(
    title = "Fixed Effects of the Mixed-Effects Model"
  ) %>%
  fmt_number(
    columns = vars(Estimate, `Std. Error`, `t value`, `p value`),
    decimals = 4
  ) %>%
  cols_label(
    Predictor = "Predictor",
    Estimate = "Estimate",
    `Std. Error` = "Std.Error",
    `t value` = "Test Statistic",
    `p value` = "p.Value"
  )
results_table

# Create table for random predictors
random_pred <- coef(model)
random_df <- as.data.frame(random_pred$name)
random_df <- random_df %>%
  rownames_to_column(var = "Gene Line")
random_pred_table <- random_df |> gt() |> tab_header(
  title = "Random Effects of the Mixed-Effects Model"
) |> fmt_number(
  decimals = 4
)

random_pred_table
# Save the table as a tex and html file
gtsave(results_table, here::here("tables","model_results.tex"))
gtsave(results_table, here::here("tables","model_results.html"))
gtsave(random_pred_table, here::here("tables","random_pred_results.tex"))
gtsave(random_pred_table, here::here("tables","random_pred_results.html"))
