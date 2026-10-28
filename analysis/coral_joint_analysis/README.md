# Complete joint coral analysis

The entire executable pipeline is in **coral_joint_analysis.Rmd**, in the style
and order of the original coral_analysis.Rmd. It reads source survey and GIS
files directly and embeds the full joint Stan program. It does not source the
old analysis or the experimental helper scripts.

Outputs are isolated in `outputs/coral_joint_analysis/`: Fig1–6 and FigA1–6 as
PNG/PDF, Table1–2 and TableA1–A6, the expanded regional TableA3, intermediate
data, diagnostics, paired posterior comparisons, cached model, and HTML report.

Render from the PENIP root:

```r
rmarkdown::render(
  "analysis/coral_joint_analysis/coral_joint_analysis.Rmd",
  output_dir = "outputs/coral_joint_analysis",
  knit_root_dir = getwd()
)
```

Default settings validate/import the completed joint pilot, save a separate
posterior copy, then reproduce all outputs. No new fit starts unless
`allow_new_fit: true`. To run longer chains, change the YAML warmup/sampling
settings and enable fitting. Settings/model/data changes use a different cache.
The posterior is saved immediately after sampling, before downstream outputs.

Scientific conventions retained:

- 1,200 m north/south channel-edge PEV rule, all sources and both size classes.
- Original adult/juvenile observations and baseline priors; broader DRM2024
  adults and four surveyed juvenile groups; no regional DRM2023 in this model.
- Shared source effects; region-specific density, zero inflation, shape and
  direction effects, exactly as the evaluated full joint model.
- PEV manuscript predictions explicitly select PEV. Direction effects zero;
  source effects retained. Source-averaged and 2024 outputs remain distinct.
- Original source-coverage averaging grid. Raw-versus-modeled data restricted
  to PEV; legacy survey maps/Table1 describe the original survey cohort, with
  an additional joint survey summary reporting current geographic membership.
- Unrounded habitat areas for colony totals. Original Table2 Total-doubling
  arithmetic corrected. Fixed manuscript taxon colors for treemaps.
- Regional TableA3: paired differences/95%CrIs and both posterior sign
  probabilities. No p-values, multiplicity adjustment or significance labels.
  Unsupported juvenile/All regional entries blank. Adult total =17modeled taxa.

The imported posterior is a pilot. A complete report is not a claim that all
model diagnostics pass or that final manuscript sampling has been completed.
