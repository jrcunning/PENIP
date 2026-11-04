# Main coral analysis — 3 November 2026

## Original fit-check framework restored — 4 November 2026

The current Rmd now recomputes native count-scale Bayesian R-squared and
the original density-scale global/grouped posterior predictive statistics.
The existing dataset/region diagnostics remain. No model was refit.

- R-squared: 0.241215, 95% CrI [0.188354, 0.340665], all 4,000 draws.
- Global PPPs from 1,000 replications: mean .652, variance .828, zeros .545,
  skewness .788, chi-squared discrepancy .149.
- Observed and replicated chi-squared discrepancies use the same expected
  densities within each posterior draw, correcting the original implementation.
- Grouped checks retain the original mean, SD, zeros and skewness statistics
  and the PPP <.05 or >.95 diagnostic thresholds. The pooled tally has 444
  statistics in observed-positive groups, of which 411 are defined and 10
  flagged. The remaining 33 have undefined skewness in constant replications;
  their probabilities are left blank, not replaced or silently conditioned on
  defined replications. Separate PEV and Broward–Miami results are also saved.
- Six diagnostic figures are now explicitly saved: the original five-panel
  global plot, its two-region counterpart, and four grouped faceted plots.
  The archived original defined plots but disabled those chunks (`eval=FALSE`)
  and had no explicit figure-save calls.
- Files: `bayesian_r2.csv`, `posterior_predictive_global.csv`,
  `posterior_predictive_grouped*.csv`, `ppc_global_density*.png` and
  `ppc_grouped_*.png` in `outputs/coral_analysis/`.
- The complete report rendered successfully. All six numerical check
  validations and seven pipeline validations passed. All 45 audited model,
  manuscript PNG and manuscript/numerical CSV files stayed byte-identical;
  see `original_framework_preservation.csv`. Model MD5 remains unchanged.
- Predictive draw caches live in the ignored analysis `data/` output folder.
  Scientific estimates, priors, fitting settings and PEV targets are unchanged.

The pre-existing ACER convergence/tail caveat below still applies. Predictive
fit checks do not establish convergence. The manuscript Methods review is at
the model-fit/PPC paragraph; its old numerical values must be replaced using
these recomputed checks. The preceding prior paragraph may omit the default
LKJ(1) from the main text, as agreed, while retaining it in code.

The current fit and report are complete. Nothing is fitting or rendering.
Use `analysis/coral_analysis.Rmd` or
`analysis/coral_analysis/run_coral_analysis.R`. Both default to the saved 4,000-draw configuration with new fitting
disabled. Do not start a fit merely to regenerate figures or tables.

## Saved fit

- Output: `outputs/coral_analysis/`.
- Model: `models/db9da5156777a9344ac26acd2b9ce2ac/brms_fit.rds` within it.
- Model MD5: `e830a6cb31d99f8620bf6165759bd4d3`.
- Four chains: 1,000 warmup + 1,000 sampling each, five threads/chain.
- adapt_delta .95, depth 11, seed 20261026, initialization 0.
- Sampling runtime 71.3 minutes; 4,000 retained draws.
- Full report: `coral_analysis.html` in the output directory.
- Detailed interpretation: `CONVERGENCE_RUN_ASSESSMENT.md` there.

## Scientific status

The fit improved over the short pilots but is provisional: max parameter Rhat
1.018855, min bulk ESS 266.307, min tail ESS 531.392, zero divergences/depth hits.
Main Table A3 density/contrast targets have max Rhat 1.00360, min bulk ESS about
3,970 and min tail ESS about 2,779. Sparse ACER cell means remain unstable;
one regional adult Middle Reef draw supplies 61% of its mean. No draws removed.
Discuss ACER mixing/regularization before more fitting; no alternative fit is
automatically authorized. All observed 2024 PPC metrics fall within their 95%
replication intervals; this does not by itself establish convergence.

2024 adult density: PEV 1.031393 [0.831459, 1.279704], Broward–Miami 1.307546
[1.107882, 1.547714]; Pr(PEV < BM) .95975. Adult ACER: PEV .00590365
[.00182279, .01476484], BM .02233269 [.00877993, .04999851]; probability .98325.
PEV survey-averaged adult/juvenile/combined: .8612875/1.0852628/1.9465503.

Preserve region-specific PEV manuscript predictions, zero direction effects,
source effects retained, equal habitat weighting, eligible juvenile coverage,
17-taxon adult sums and draw-wise covariance. The original PEV analysis is
preserved in the archive under the name `coral_analysis_original.Rmd`. The Fig A1 habitat-label error was corrected using explicit factor
order and named labels; model and numerical estimates were unchanged.

## Repository cleanup

Development analyses and outputs are archived in
`old_working_files/coral_comparison_2026-11-03/`, retaining paths, checksums and
prior tracking status. The October archive is also retained. Historical
comparison code was removed from this Rmd after preserving the complete source
and report; the current pipeline has no archive dependency. Shared input data and the conch analysis remain in place. The original coral
source, figures and tables are now under
`old_working_files/coral_analysis_original_2026-11-03/`. The selected joint
pipeline was promoted to `analysis/coral_analysis.Rmd`; its complete cached fit
moved to `outputs/coral_analysis/` without changing the saved posterior. Check the
archive README and manifest to revisit prior models. Do not run archived scripts
against the active output directory without restoring their intended paths.

## Manuscript output routing

The coral analysis publishes Fig 2–6, Fig A1–A6 and Table A1–A6 to `outputs/`.
Run `analysis/integrated_figures_tables.Rmd` afterward to regenerate combined
Fig 1, Table 1 and Table 2 from `outputs/coral_analysis/intermediate/` and the
existing conch cache. Its spatial input is now the current coral analysis's
`data/polygons_final.rds`. Conch Fig 7–8/A7–A8 and shared data are preserved.

## Combined preparation workflow

The broader Broward–Miami DRM import now follows the original six survey
imports, before spatial assignment and common filtering. The pooled rarity
cutoff retains taxa with >5 colonies across the combined imported observations.
This yields the same retained taxa as before. The local KML remains the source
for original survey habitats; the regional layer remains the source for added
DRM habitats. Duplicate original metadata sites and DRM PTCH sites stay
excluded, and response-specific zero completion/search effort is preserved.

Preflight validation confirmed exact equality of every fitted model column and
factor encoding, plus byte-identical joint_model_inputs.csv. The model hash
remains db9da5156777a9344ac26acd2b9ce2ac. No new fit is needed or enabled.
Table 1 and compilation summaries now describe all 16,340 observations,
38,130 colonies, 20 taxa and 1,069 survey sites; Table 1 has a separate row for
the 93 added DRM sites. The model still has six dataset levels, and manuscript
source-availability grids and PEV prediction targets remain unchanged.

There are 19 habitat exclusions across the combined compilation: 13 Sand,
2 Scattered Rock, 2 Ridge, 1 Inlet Channel and 1 Acropora cervicornis polygon.
The PTCH exclusion and duplicate-site removal are separate import exclusions.
Selection audits and compilation_summary.csv are in outputs/coral_analysis/.
Snapshots before reorganization are in
old_working_files/coral_preparation_reorganization_2026-11-03/.
