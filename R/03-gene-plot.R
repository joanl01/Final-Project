# Load Required Packages
pacman::p_load(tidyverse, showtext,colourvalues,ggrepel,egg, here,readxl,harrypotter, ggpubr, patchwork)
# Read in cleaned dataset
df <- read_csv(
  here::here("data", "2024-03-05-gene-data.csv")
)
# Remove "GL-" from the name of the gene lines
df$name <- fct_recode(df$name,
                      "cwN"="GL-cwN",
                      "rjS"= "GL-rjS",
                      "XIb" = "GL-XIb",
                      "ZHw"="GL-ZHw",
                      "kYH" ="GL-kYH",
                      "MFA" = "GL-MFA",
                      "Xik" = "GL-Xik",
                      "cDZ" = "GL-cDZ")

# Define colour palette
blue <- colourvalues::convert_color(c(130, 168, 205))
beige <- colourvalues::convert_color(c(209, 182, 157))
col_pal <- c(blue, beige)
col_pal
# Add font
font_add(
  family = "times",
  regular = here::here(
    "Fonts", "Times New Roman.ttf"
  )
)

#df$cell_line <- factor(df$cell_line, levels = rev(levels(df$cell_line)))
# Filter dataset to only have cell-type 101
df_ct101 <- df %>% filter(cell_line == "Cell-type 101")
# Filter dataset to only have wild-type
df_wt <- df %>% filter(cell_line == "Wild-type")

#last_point_ct101 <- df_ct101 %>%
#  group_by(name) %>%
#  filter(row_number() == n())

#last_point_wt <- df_wt %>%
#  group_by(name) %>%
#  filter(row_number() == n())


# Set running
showtext_auto()
# Plot for cell-type 101
ct_101_plot <- df_ct101 %>% ggplot(aes(x = conc, y = gene_expression, label = name)) +
  geom_point(aes(fill=treatment),
             colour="black",shape=21, size=3) +
  # set labels for gene line
  geom_label_repel(#data = last_point_ct101,
    aes(label = name,fill = treatment),
    color = "black",
    data = ~ subset(.,conc == 10),
    max.overlaps = Inf,
    show.legend = FALSE,
    min.segment.length = 0,
    nudge_x = 1,
    size = 15,
    family = "times") +
  # change colours of points
  scale_fill_manual(values = col_pal, labels = c("Activating factor 42", "Placebo"))+
  theme_bw() +
  # change x-axis scale
  scale_x_continuous(minor_breaks = seq(0,12.5,0.5), breaks = seq(0,10, by=1)) +
  # give labels to plot
  labs(
    x = "Concentration of Treatment (\u00b5g/ml)",
    y = "Gene Expression"
  ) + ggtitle("Cell-type 101") +
  guides(fill = guide_legend(title = "Treatment"))+
  # Set font
  theme(text = element_text(family = "times", size = 50))
ct_101_plot

# Plot for Wild-type cell
wt_plot <- df_wt %>% ggplot(aes(x = conc, y = gene_expression, label = name)) +
  geom_point(aes(fill=treatment),
             colour="black",shape=21, size=3) +
  # set labels for gene line
  geom_label_repel(#data = last_point_ct101,
    aes(label = name,fill = treatment),
    color = "black",
    data = ~ subset(.,conc == 10),
    max.overlaps = Inf,
    show.legend = FALSE,
    min.segment.length = 0,
    nudge_x = 1,
    size = 15,
    family = "times") +
  # change colours of points
  scale_fill_manual(values = col_pal, labels = c("Activating factor 42", "Placebo")) +
  theme_bw() +
  # change x-axis scale
  scale_x_continuous(minor_breaks = seq(0,12.5,0.5), breaks = seq(0,10, by=1)) +
  # give labels to plot
  labs(
    x = "Concentration of Treatment (\u00b5g/ml)",
    y = "Gene Expression"
  )+ ggtitle("Wild-type") +
  guides(fill = guide_legend(title = "Treatment"))+
  # Set font
  theme(text = element_text(family = "times", size = 50))
wt_plot
# Combine two plots into one
report <- wt_plot +  ct_101_plot + plot_layout(guides = "collect") & theme(legend.position = "bottom") & plot_annotation(tag_levels = 'A')
report

# Save figure
ggsave(filename = here::here("pretty-figures","gene_plot.tiff"),
       dpi = 500,
       plot = report,
       width = 9,
       height = 6,
       units = "in")


