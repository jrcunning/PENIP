# Joint coral analysis

The current pipeline is **coral_joint_brms_analysis.Rmd**. Its figures, tables,
diagnostics and HTML report are under
`outputs/coral_joint_analysis/brms_2024_4000draws/`.

[Open the report](../../outputs/coral_joint_analysis/brms_2024_4000draws/coral_joint_brms_analysis.html).
[Read the fit assessment](../../outputs/coral_joint_analysis/brms_2024_4000draws/CONVERGENCE_RUN_ASSESSMENT.md).

## Run or regenerate the analysis

From the project root:

```r
source("analysis/coral_joint_analysis/run_4000_draw_comparison.R")
```

The Rmd and runner default to reusing the saved model, with new fitting disabled.
The pipeline rebuilds its observations from shared source data; no archived
script, prior model or pilot output is an input. All code for the current
analysis, including annotated prior generation, is in the Rmd. The original
`analysis/coral_analysis.Rmd`, conch analysis and integrated analysis are retained.

The cached posterior is
`outputs/coral_joint_analysis/brms_2024_4000draws/models/db9da5156777a9344ac26acd2b9ce2ac/brms_fit.rds`.
Keep that local cache to avoid refitting. Fitted models, chain CSVs and generated
data/intermediate caches are ignored by Git; the source, report, figures, tables
and current diagnostics remain trackable. A fresh clone requires a separate
copy of the local model cache or an explicitly enabled new fit.

## Current model and interpretation

The shared-distribution brms model uses all original survey observations plus
the 2024 Broward–Miami DRM data, four chains, 1,000 warmup and 1,000 sampling
iterations per chain, five threads per chain, revised priors, adapt_delta .95
and max_treedepth 11. It retains 4,000 draws. The model and numerical estimates
are unchanged by the cleanup.

PEV uses the 1,200 m north/south channel-edge definition. Manuscript predictions
explicitly select PEV; regional comparisons use paired predictions for each
region. Only comprehensively surveyed juvenile responses are compared, and
adult totals sum the same 17 modeled taxa. Fig A1 explicitly orders habitats
NRC, IR, MR, OR and matches abbreviations by habitat name.

The current working fit remains provisional: maximum parameter Rhat 1.0189,
minimum bulk ESS 266.3, zero divergences and depth hits. Principal density and
contrast estimates are stable, but sparse ACER habitat-cell means retain long
tails. Read CHECKPOINT.md and the assessment before further model work. No
additional fit is running or authorized by this cleanup.

## Archived development work

Earlier separate regional models, joint Stan implementations, brms pilots,
prior reviews and comparison-only outputs are kept locally under
`old_working_files/coral_comparison_2026-10-28/` and
`old_working_files/coral_comparison_2026-11-03/`.
Each archive includes a manifest and checksums. The November archive also keeps
the current source and full comparison report as they stood before cleanup.
The active Rmd no longer runs those historical comparison sections.

The entire `old_working_files/` directory is ignored by Git. Previously tracked
draft paths are removed from the index; earlier committed versions remain in
Git history. Shared raw/processed data and original manuscript outputs remain
in place. The archives are local records, not a runtime dependency.
