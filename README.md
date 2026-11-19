# DATA 550 Midterm Project: SARS-CoV-2 Wastewater Surveillance

## Project Description

This project uses CDC SARS-CoV-2 wastewater surveillance data from Georgia. We aim to examine county-level wastewater data and understand how SARS-CoV-2 activity levels vary across Georgia counties and over time.

The report includes:

- **Table 1:** Descriptive analysis of wastewater surveillance data
- **Figure 1:** Map showing average SARS-CoV-2 wastewater viral activity across Georgia counties over the most recent six months (default)
- **Figure 2:** SARS-CoV-2 wastewater viral activity levels in Georgia over time (April 2022 – November 2026)

## Team Members

- Aditi Nayak – Team Lead, GitHub repository management, report integration
- Stephanie Sanchez – Data cleaning, variable selection
- Shynitha Pulluri – Table 1, descriptive analysis, parameterization of report
- Kashvi Sarup – Figure 1, county-level map
- La’el Williams – Figure 2, wastewater activity trends
- Elizabeth Jackson – Makefile

## Repository Structure

- `code/` – R scripts for data cleaning, analysis, and figures
- `data/raw/` – Original CDC wastewater surveillance dataset
- `data/clean/` – Cleaned data and Georgia county boundaries (`ga_counties_2025.rds`)
- `output/` – Generated tables and figures
- `final_report.Rmd` – R Markdown file for the final report
- `render_report.R` – R script used to render the report with parameters
- `Makefile` – Automates the report-building process
- `README.md` – Project description and instructions

## Data Source

CDC SARS-CoV-2 wastewater surveillance data, subsetted to Georgia.

**Variables used in the analysis:**

- **record_id:** Unique identifier for each observation.
- **sample_collect_date:** Date the wastewater sample was collected.
- **site:** Unique identifier for the wastewater treatment plant.
- **state_territory:** State where the wastewater treatment plant is located (GA).
- **source:** Source of the data submitted to NWSS.
- **counties_served:** Counties served by the wastewater sampling site.
- **population_served:** Estimated population served by the sampling site.
- **pcr_target:** Target of PCR quantification.
- **sample_location:** Location where the wastewater sample was collected.
- **pcr_target_detect:** Indicates detection of the PCR target.
- **sample_matrix:** Type of wastewater sample collected.
- **wval:** Calculated wastewater viral activity level.
- **wval_category:** Category of wastewater viral activity (very low, low, moderate, high, very high, or limited/no data).

## Building the Report

The report is generated using R and a Makefile.

**Requirements:** R, Make, and the R packages used in the project scripts, including `rmarkdown`, `dplyr`, `ggplot2`, `tidyr`, `lubridate`, and `sf`.

From the main project directory, run:

```bash
make
```

This generates the cleaned dataset, tables, figures, and final HTML report.

The completed report can be viewed by opening `final_report.html`.

To remove generated files and rebuild the report:

```bash
make clean
make
```

## Customizing the Report

Figure 1 is parameterized to display wastewater viral activity over a selected number of months.

The default is **6 months**.

To generate the report using the most recent 3 months:

```bash
make report MAP_MONTHS=3
```

To use a different period, replace `3` with the desired number of months.

To restore the default:

```bash
make report MAP_MONTHS=6
```

The parameter is passed through `render_report.R` and `final_report.Rmd` to the Figure 1 script.

## Rebuilding with Updated Data

To use an updated CDC wastewater dataset, replace the CSV file in `data/raw/` with the new dataset, keeping the expected filename and column names.

Then run:

```bash
make clean
make
```

The report will be regenerated using the updated data.

## Georgia County Boundaries

The file `data/clean/ga_counties_2025.rds` contains Georgia county boundaries used for Figure 1.

This file is read by `code/02_figure1.R` and combined with the wastewater data to create the county-level map.

The boundaries are stored locally, so the report does not need to download geographic data each time it runs. The file should remain in the repository when rebuilding the report.
