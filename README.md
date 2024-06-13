::: {#quarto-content .page-columns .page-rows-contents .page-layout-article}
::: {#quarto-document-content .content role="main"}
::: {#title-block-header .quarto-title-block .default}
::: quarto-title
# Statistical Consulting Final Project {#statistical-consulting-final-project .title}
:::

::: quarto-title-meta
<div>

::: quarto-title-meta-heading
Author
:::

::: quarto-title-meta-contents
a1825938 Joan Shu Ting Lim
:::

</div>

<div>

::: quarto-title-meta-heading
Published
:::

::: quarto-title-meta-contents
June 13, 2024
:::

</div>
:::
:::

::: {#outline .section .level1}
# Outline

This repository contains the code, data, and resources used for the
analysis of Dr Karl Berator. It includes all the necessary scripts,
datasets, and documentation to reproduce the analysis and findings.
:::

::: {#data .section .level1}
# Data

The data was sent by Dr Karl Berator through email as an Excel (`.xlsx`)
file on 05 March 2024. The data was saved into the "raw-data" folder as
`2024-03-05-gene-data.xlsx`. There are 5 columns and 88 rows in the
data. The columns each represent a variable :

-   `cell_line` : There are 2 levels of cell line, those being
    "Cell-type 101" or "Wild-type".

-   `treatment` : There are 2 levels of treatment, "Placebo" or
    "Activating factor 42". "Placebo" represents a saline solution and
    "Activating factor 42" represents the new treatment being used.

-   `conc`: The concentration of treatment used, it goes from 0 to 10.

-   `name`: The gene line of the corresponding cell line. There are 8
    types of gene lines, those being "GL-cDZ", "GL-cwN", "GL-kYH", "GL-
    MFA", "GL-rjS", "GL-XIb", "GL-Xik" and "GL-ZHw".

-   `gene_expression`: The gene expression of the corresponding gene
    line

Each row represents an observation containing information of each
variable.
:::

::: {#data-cleaning .section .level1}
# Data Cleaning

The code used to conduct cleaning of data can be found in the "R" folder
with file name `01-clean-data.R`. First, the required packages are
loaded, and the dataset is read from an Excel file located in the
"raw-data" folder. The dataset is then stored in a data frame.

The variable "cell line" is inspected for its unique values.
Inconsistent values are then recoded to ensure consistency:

-   "WILD-TYPE" is recoded to "Wild-type".
-   "CELL-TYPE 101" is recoded to "Cell-type 101".

Similarly, the variable "treatment" is inspected and recoded for
consistency:

-   "activating factor 42" is recoded to "Activating factor 42".
-   "placebo" is recoded to "Placebo".

The variable "name" is inspected and recoded to ensure consistent
naming:

-   "Gl-Cwn" is recoded to "GL-cwN".
-   "Gl-Rjs" is recoded to "GL-rjS".
-   "Gl-Xib" is recoded to "GL-XIb".
-   "Gl-Zhw" is recoded to "GL-ZHw".

The cleaned dataset is saved as a CSV file in the "data" folder with the
file name `2024-03-05-gene-data.csv`.

This series of steps ensures that the dataset is cleaned and
standardised, making it ready for further analysis, such as
investigating the effect of treatment on gene expression.
:::

::: {#task-1-powerpoint-presentation-on-exploratory-data-analysis-eda .section .level1}
# Task 1 : Powerpoint Presentation on Exploratory Data Analysis (EDA)

The code used to conduct EDA of the data can be found in the folder "R",
with file name `02-EDA.R`. To conduct EDA of the data, the necessary R
packages are first loaded. Then, the cleaned dataset is loaded from
`2024-03-05-gene-data.csv` located in the "data" folder.

The dataset is filtered into 4 different categories based on the
treatment used and the cell_line: - Data with "Activating factor 42" as
treatment and "Cell-type 101" cell line. - Data with "Activating factor
42" as treatment and "Wild-type" cell line. - Data with "Placebo" as
treatment and "Cell-type 101" cell line. - Data with "Placebo" as
treatment and "Wild-type" cell line.

An EDA is then performed on the filtered datasets. This provides some
statistics, such as mean, variance, median of the dataset.

The cleaned dataset is then filtered into two datasets to contain only
"Cell-type 101" cell line or "Wild-type" cell line.

A plot is then created for the "Cell-type 101" cell line. This plot
shows the relationship between treatment, concentration of treatment and
gene expression. The plot has different colours representing different
gene lines and different shapes representing different treatments used.
The round points represent the "Activating factor 42" treatment is used
and the triangular points represent "Placebo" treatment is used.

The plot for "Cell-type 101" cell line is then saved as a PDF file in
the "pretty-figures" folder with the file name `ct_101_plot.pdf`

A similar plot for "Wild-type" cell line is created, showing the
relationship between treatment, concentration of treatment and gene
expression. The plot has different colours representing different gene
lines and different shapes representing different treatments used. The
round points represent the "Activating factor 42" treatment is used and
the triangular points represent "Placebo" treatment is used.

The plot for "Wild-type" cell line is then saved as a PDF file in the
"pretty-figures" folder with the file name `wt_plot.pdf`

The summary statistics and plots generated are used to create a
Powerpoint presentation named `Powerpoint_a1825938` in the
"powerpoint_slides" folder.
:::

::: {#task-2-figure .section .level1}
# Task 2 : Figure

The code used to produce the required figure can be found in the folder
"R", with file name `03-gene-plot.R`. To produce the requested figure by
Dr Karl Berator, the required packages are first loaded. The cleaned
dataset is then loaded from `2024-03-05-gene-data.csv` located in the
"data" folder. The "GL-" prefix is removed from the names of the gene
lines to match the label in the requested figure from Dr Karl Berator.

A custom colour palette is then defined, these colours were harvested
using the Digital Colour Meter from the requested figure. The .ttf file
of the Times New Roman fonts is exported into the "Fonts" folder, and
added for use in the plots. The dataset is filtered into 2 datasets: -
Data with "Cell-type 101" cell line - Data with "Wild-type" cell line.

A plot is first created for the "Cell-type 101" cell line, showing the
relationship between gene expression and concentration of treatment. The
plot used blue to represent "Activating factor 42" as treatment used,
and beige to represent "Placebo" as treatment used. Each gene line is
also labelled at the last point. The Times New Roman font is also
applied to all of the text in the plot.

A similar plot for "Wild-type" cell line with the same elements and
customisations. The two plots are then combined into one figure, with a
shared legend positioned at the bottom. The combined figure is then
saved as a 500 resolution TIFF file in the "pretty-figures" folder with
file name `gene_plot.tiff`.
:::

::: {#task-3-sample-size-calculation .section .level1}
# Task 3 : Sample size calculation

The code used to calculate the required sample size can be found in the
folder "R", with file name `04-sample-size-calculation.R`. Dr Karl
Berator requested for a sample size calculation of power 90% and
significance level 0.05 for a linear regression of gene expression with
predictors concentration, cell age, treatment (two levels), cell type
(two levels), and media (two levels). A previous study was done and an
[\\(R\^2\\)]{.math .inline} of 0.1 between the predictors and the
response level was obtained.

To calculate the sample size, the parameters below are defined:

-   R-squared value, which is calculated to be 0.1
-   Desired power of 0.9 (90%)
-   Significance level of 0.05
-   The number of predictors is 5, because there are 5 predictors
    (concentration, cell age, treatment, cell type and media)

The effect size [\\(f\^2\\)]{.math .inline} is calculated using the
formula [\\\[ f\^2 = \\frac{R\^2}{1-R\^2}\\\]]{.math .display}

The required sample size is calculated using the power analysis function
for linear regression. The total sample size [\\(n\\)]{.math .inline} is
determined using the formula [\\\[n = u + v + 1\\\]]{.math .display}
where [\\(u\\)]{.math .inline} is the number of predictors, and
[\\(v\\)]{.math .inline} is the number of error degrees which can be
observed from the output. The observed [\\(v\\)]{.math .inline} is
147.8645.

The required sample size for for a linear regression to achieve a power
of 90% at a significance level of 0.05 with a previously calculated
R-squared of 0.1 with 5 predictor is found to be [\\\[ n = 5 +
147.8645 + 1 = 153.8645\\\]]{.math .display} Rounding 153.8645 to the
next integer, the sample size required is 154.
:::

::: {#task-4-imrad-report .section .level1}
# Task 4 : IMRaD Report

The code used to conduct the analysis to write the IMRaD report can be
found in the folder "R", with file name `05-imrad-analysis.R`. Dr Karl
Berator requested an IMRaD report of a predictive model of gene
expression. First, the required packages to conduct the analysis are
loaded. The cleaned dataset is read from `2024-03-05-gene-data.csv`
located in the "data" folder. From the previous plot `gene_plot.tiff` in
the "pretty-figures" folder, it can be noticed that not all gene lines
show an increase in gene expression as concentration of "Activating
factor 42" increase. To take this variation into account, a mixed
effects model is fitted with gene expression as the response variable
and the interaction of treatment, concentration, and cell line as fixed
effects. The model includes a random effect for gene lines.

The summary of the fitted model is obtained, which includes estimates,
standard errors, t-values, and p-values for the fixed effects. The
coefficients and p-values for the fixed effects are extracted from the
model summary. These values are combined into a data frame. The
extracted coefficients and p-values are combined into a single data
frame, including the predictors.

A table of the fixed effects is created, including estimates, standard
errors, t-values, and p-values. A separate table is created for the
random effects of the model, specifically the random intercepts for each
gene line. Both tables (fixed effects and random effects) are saved as
TeX and HTML files in the "tables" folder for further use and reporting.
The tables for the fixed effects are named as `model_results` and the
tables for the random effects are named as `random_pred_results`.

The resulting IMRaD report concluding the findings can be found in the
"Reports" folder with the file name `Karl_IMRaD.pdf`.
:::
:::
:::
