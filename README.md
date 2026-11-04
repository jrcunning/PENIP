[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17065530.svg)](https://doi.org/10.5281/zenodo.17065530)

This repository contains data and code to accompany the report titled

### Integrated Analysis of Coral Density and Community Structure Across Reef Habitats Near Port Everglades in Advance of Dredging Operations

by Ross Cunning, Xaymara Serrano, and Erin Winslow

In this report, we integrate survey datasets and statistical modeling to estimate coral density and community composition across reef habitats at Port Everglades prior to dredging operations.

#### Repository contents:

- **data/** – Raw and processed survey data, site metadata, and spatial layers  
- **analysis/** – Scripts for all data processing, analysis, and visualization
- **outputs/** – Figures and tables generated from analyses  


The main coral pipeline is [analysis/coral_analysis.Rmd](analysis/coral_analysis.Rmd),
using the joint PEV and Broward–Miami model. Its report and cached fit are under
`outputs/coral_analysis/`. Run it before
[analysis/integrated_figures_tables.Rmd](analysis/integrated_figures_tables.Rmd)
to regenerate the combined coral–conch manuscript outputs in `outputs/`.
See [the run instructions](analysis/coral_analysis/README.md).

The original PEV-only analysis is preserved locally as `coral_analysis_original.Rmd`
under `old_working_files/coral_analysis_original_2026-11-03/`, together with its
previous figures and tables. The archive is excluded from Git.
