# Load required packages
pacman::p_load(tidyverse,readxl)

# Read in dataset
df <- read_excel(here::here("raw-data", "2024-03-05-gene-data.xlsx"))
# Get a glance on dataset
head(df)

# Check variable cell line
table(df$cell_line)
# Recode for consistency
df$cell_line <- fct_recode(df$cell_line,
                           "Wild-type"="WILD-TYPE",
                           "Cell-type 101" = "CELL-TYPE 101")

# Check variable on treatment
table(df$treatment)
# Recode treatment for consistency
df$treatment <- fct_recode(df$treatment,
                           "Activating factor 42" = "activating factor 42",
                           "Placebo" = "placebo")

# Check variable on name/gene line
table(df$name)
# Recode name for consistency
df$name <- fct_recode(df$name,
                      "GL-cwN" = "Gl-Cwn",
                      "GL-rjS"="Gl-Rjs",
                      "GL-XIb" = "Gl-Xib",
                      "GL-ZHw"="Gl-Zhw"
)
# Want to find if there are effect of treatment on the effect of growth factor on the gene expression
# Save cleaned data into csv
write_csv(df, "data/2024-03-05-gene-data.csv")
