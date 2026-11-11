# DATA 550 Midterm Project: RSV  Wastewater Surveillance in Georgia

## Project Description

This project uses CDC RSV wastewater surveillance data from Georgia. We aim to examine county-level wastewater data and understand how RSV activity levels vary across Georgia counties and over a six-month period.

The report will include:
- Table 1: Descriptive analysis of the wastewater surveillance data
- Figure 1: Map showing RSV wastewater surveillance across Georgia counties
- Figure 2: RSV activity levels in Georgia over six months

## Team Members

- Aditi Nayak – Team Lead, GitHub repository management
- Stephanie Sanchez – Data cleaning, variable selection
- Shynitha Pulluri – Table 1, descriptive analysis, parameterized report
- Kashvi Sarup – Figure 1, county-level map
- La’el Williams – Figure 2, six-month activity trends
- Elizabeth Jackson – Makefile

## Repository Structure

- `code/` – R scripts for data cleaning, analysis, and figures
- `data/raw/` – Original CDC wastewater surveillance dataset
- `data/clean/` – Cleaned datasets used for analysis
- `output/` – Generated reports, tables, and figures
- `README.md` – Project description and instructions

## Data Source

CDC RSV wastewater surveillance data, subsetted to Georgia.
DISCLAIMER: DATA was actually filtered for RSV not SARS-CoV-2. 


**record_id**: A unique identifier for each row of data.

**sample_collect_date**: Sample collection date YYYY-MM-DD

**site**: A unique identifier for wastewater treatment plants.

**state_territory**: Set to GA, state in which the wastewater treatment plant is located

**source**: The source of the data submitted to NWSS (e.g, State_Territory, WastewaterSCAN, CDC_Verily, & CDC_Biobot).

**counties_served**: The county and county-equivalent names corresponding to the FIPS codes in 'county_fips'

**population_served**: Estimated number of persons served by this sampling site (i.e., served by this wastewater treatment plant or, if 'sample_location' is "upstream", then by this upstream location).

**pcr_target**: The target of the PCR quantification (pathogen or antimicrobial resistance (AMR) groups).

**sample_location**: Sample collection location in the wastewater system, whether at a wastewater treatment plant  or upstream in the wastewater system.

**pcr_target_detect**: The target of the PCR quantification (pathogen or antimicrobial resistance (AMR) groups).

**sample_matrix**: Wastewater matrix from which the sample was collected. Wastewater matrix is a categorical variable specifying the type of wastewater sample used (e.g., raw influent, primary sludge, settled solids).






## Building the Report

The report will be generated using R and a Makefile.

Detailed instructions, including the required R packages and commands to build the report, will be added once the team's code and Makefile are finalized.

## Customizing the Report

The report will support customization through parameters.

Instructions for changing report parameters will be added once the parameterized report is finalized.