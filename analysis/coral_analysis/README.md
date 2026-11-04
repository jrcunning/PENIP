# Main coral analysis

The main source is [analysis/coral_analysis.Rmd](../coral_analysis.Rmd).
It uses the joint PEV and Broward–Miami brms model and supersedes the original
PEV-only analysis.

- [Coral report](../../outputs/coral_analysis/coral_analysis.html)
- [Fit assessment](../../outputs/coral_analysis/CONVERGENCE_RUN_ASSESSMENT.md)
- Coral-only figures, tables, diagnostics and cached posterior:
  `outputs/coral_analysis/`
- Final manuscript figures and tables: `outputs/`

## Regenerate results

Run these commands from the project root, in this order:

```r
source("analysis/coral_analysis/run_coral_analysis.R")
rmarkdown::render(
  "analysis/integrated_figures_tables.Rmd",
  output_dir = "outputs",
  knit_root_dir = getwd()
)
```

The coral analysis reuses the saved 4,000-draw posterior; new fitting is disabled
by default. It publishes Fig 2–6, Fig A1–A6 and Table A1–A6 to `outputs/`.
The integrated analysis then combines the current coral intermediates with the
existing conch results to produce Fig 1, Table 1 and Table 2 there. Conch Fig 7–8
and Fig A7–A8 remain in place. Coral-only Fig 1 and Table 1–2 remain in the coral
subdirectory and do not overwrite the combined manuscript versions.

The cached model is
`outputs/coral_analysis/models/db9da5156777a9344ac26acd2b9ce2ac/brms_fit.rds`.
Keep this local cache to avoid refitting. Model files, individual chain CSVs and
generated data/intermediate caches are ignored by Git. A fresh clone requires a
separate copy of the model cache or an explicitly enabled new fit. The analysis
rebuilds observations from shared source data and does not require archived code
or prior fits.

## Data preparation

The Import data section includes all six original survey efforts and the
broader 2024 Broward–Miami DRM observations. Taxonomic aggregation uses the
same lookups, and the combined imported observations are filtered to taxa
represented by more than five colonies. This retains the same modeled taxa as
the previous preparation. Original sites use the local habitat KML; additional
DRM sites use the regional layer. Duplicate Shedd metadata sites and DRM PTCH
sites remain excluded. A common habitat filter retains NRC, IR, MR and OR,
including the established Artificial-to-NRC and Aggregated-Patch-Reef-to-OR
pooling. Zero completion and searched areas follow each survey's coverage;
unsurveyed regional juveniles never receive zeros.

The full compilation has 16,340 observations, 38,130 colonies, 20 taxa and
1,069 sites across survey datasets. Table 1 now includes a separate row for
the 93 additional regional DRM sites. This reporting row does not create a new
model dataset: all 2024 observations retain the `drm24` level. The existing
local map panels describe the original survey cohort. Manuscript prediction
grids preserve the original source availability and PEV prediction target.

`taxon_filter_audit.csv`, `all_survey_habitat_filter_audit.csv`,
`regional_import_audit.csv` and `compilation_summary.csv` document selection.
The reorganization was checked against the saved fit: every fitted input
column and factor encoding matches, and `joint_model_inputs.csv` is
byte-identical. The pre-reorganization source, data and reports are preserved
under `old_working_files/coral_preparation_reorganization_2026-11-03/`.

## Interpretation and saved fit

The model uses the original survey observations plus 2024 Broward–Miami DRM
data, shared zero inflation and shape across regions, revised priors, four
chains, 1,000 warmup and 1,000 sampling iterations per chain, five threads per
chain, adapt_delta .95 and max_treedepth 11. Renaming the pipeline does not
change the model, posterior draws or numerical results.

Manuscript predictions explicitly select PEV, using the 1,200 m north/south
channel-edge definition. Regional comparisons use paired region-specific
predictions for 2024. Only comprehensively surveyed juvenile responses are
compared, and adult totals sum the same 17 modeled taxa. Fig A1 explicitly
orders habitats NRC, IR, MR, OR with labels matched by habitat name.

The working fit remains provisional: maximum parameter Rhat 1.0189, minimum
bulk ESS 266.3, zero divergences and depth hits. Principal density and contrast
estimates mix well, but some sparse ACER habitat-cell means retain long tails.
See CHECKPOINT.md and the fit assessment before further model work.

## Model fit checks

The Rmd also reproduces the original evaluation framework from the saved fit:
native count-scale Bayesian R-squared using all 4,000 posterior draws, plus
1,000 posterior predictive replications for density-scale global and grouped
checks. Global statistics are mean, variance, zero proportion, skewness and a
chi-squared discrepancy. Grouped statistics are mean, standard deviation,
zero proportion and skewness within taxon/size-class/habitat groups. Both
sets are reported overall and separately for PEV and Broward–Miami; the
existing finer dataset/region checks remain available.

The observed and replicated chi-squared discrepancies now use the same
expected densities within each posterior draw. Undefined grouped statistics
are reported explicitly, and their diagnostic probabilities remain blank.
The original grouped diagnostic thresholds (<0.05 or >0.95) are retained;
these posterior predictive probabilities are not classical significance tests.

Outputs include `bayesian_r2.csv`, `posterior_predictive_global.csv`,
`posterior_predictive_grouped.csv`, `posterior_predictive_grouped_summary.csv`,
and `original_framework_check_validation.csv`. The five global panels and
four grouped plots are saved as `ppc_global_density*.png` and
`ppc_grouped_*.png`. These are diagnostic figures, separate from the numbered
manuscript figures. Matching predictive draws are cached under the ignored
`outputs/coral_analysis/data/` directory. No additional model fit is needed.

## Original analysis and development archive

The original source is preserved as
`old_working_files/coral_analysis_original_2026-11-03/analysis/coral_analysis_original.Rmd`.
That archive also contains its figures, tables, intermediate outputs, a copy of
the original saved model/prepared data and snapshots taken before promotion.
Its manifest records original paths, checksums and prior Git tracking status.

Earlier experiments remain under
`old_working_files/coral_comparison_2026-10-28/` and
`old_working_files/coral_comparison_2026-11-03/`.
All archives are local, ignored by Git and not runtime dependencies. Shared
data and the conch analysis remain in their existing locations.
