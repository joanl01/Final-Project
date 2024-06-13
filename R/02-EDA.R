# Load required packages
pacman::p_load(tidyverse,readr, harrypotter)
# Load dataset
df <- read_csv(here::here("data", "2024-03-05-gene-data.csv"))
# Filter dataset to different categories:
# Cell-type 101 and new tratment
df_af42_ct101 <- df %>%
  filter(treatment == "Activating factor 42", cell_line == "Cell-type 101")
# Wild-type and new treatment
df_af42_wt <- df %>%
  filter(treatment == "Activating factor 42", cell_line == "Wild-type")
# Cell-type 101 and placebo
df_plac_ct101 <- df |>
  filter(treatment == "Placebo", cell_line == "Cell-type 101")
# Wild-type and placebo
df_plac_wt <- df |>
  filter(treatment == "Placebo", cell_line == "Wild-type")

# EDA of:
# Cell-type 101 and placebo
skimr::skim_without_charts(df_plac_ct101)
# Cell-type 101 and new treatment
skimr::skim_without_charts(df_af42_ct101)
# Wild-type and placebo
skimr::skim_without_charts(df_plac_wt)
# Wild-type and new treatment
skimr::skim_without_charts(df_af42_wt)

# Filter dataset to contain only data with:
# Cell-line is Cell-type 101
df_ct101 <- df |> filter(cell_line == "Cell-type 101")
# Cell line is Wild-type
df_wt <- df |> filter(cell_line == "Wild-type")


# Plot for Cell-type 101
ct_101_plot <- df_ct101 |> ggplot(
  aes(x = conc, y = gene_expression, col = name, shape = treatment)
) + geom_point(size = 3) + geom_line(linewidth = 1.1) + scale_color_hp(discrete = TRUE, house = "Ravenclaw") +
  labs(
    title = "Plot of Cell-type 101 against different concentrations of different treatments",
    x = "Concentration of treatment",
    y = "Gene expression",
    col = "Name of cell line",
    shape = "Type of treatment"
  ) + theme(text=element_text(size=16),axis.text=element_text(size=16),legend.position = "bottom")

ct_101_plot
# Save plot as ct_101_plot
ggsave(
  filename = here::here("pretty-figures", "ct_101_plot.pdf"),
  plot = ct_101_plot,
  width = 12,
  height = 9
)

# Plot for Wild-type
wt_plot <- df_wt |> ggplot(
  aes(x = conc, y = gene_expression, col = name, shape = treatment)
) + geom_point(size = 3) + geom_line(linewidth = 1.1) + harrypotter::scale_color_hp(discrete = TRUE, house = "Ravenclaw") +
  labs(
    title = "Plot of Wild-type against different concentrations of different treatments",
    x = "Concentration of treatment",
    y = "Gene expression",
    col = "Name of cell line",
    shape = "Type of treatment"
  ) + theme(text=element_text(size=16),axis.text=element_text(size=16),legend.position = "bottom")

# Save plot as wt_plot
ggsave(
  filename = here::here("pretty-figures", "wt_plot.pdf"),
  plot = wt_plot,
  width = 12,
  height = 9
)
