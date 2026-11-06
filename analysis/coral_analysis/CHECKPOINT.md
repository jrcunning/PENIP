# Main coral analysis — 6 November 2026

## Current decision — equal habitat weighting restored, 6 November 2026

The user explicitly restored equal NRC/IR/MR/OR weights (1/4 each) for both
regional comparisons and temporal trends. Overall PEV habitat-averaged density
summaries use the same equal weights. Own-area weighting is retained only as a
labeled sensitivity. This decision supersedes the earlier area-weighting notes
below. The model, likelihood, data, priors, PEV classification, prediction target
and all 4,000 posterior draws are unchanged; no model was refit.

- Table A3 and regional_density_comparison.png/.pdf use equal habitat weights
  in both regions, with dataset=drm24, source effects retained and direction zero.
- Adult total: PEV 1.031393 [0.831459, 1.279704], Broward–Miami 1.307546
  [1.107882, 1.547714] colonies/m². Paired difference −0.276153
  [−0.569296, 0.029876]; Pr(PEV < BM)=0.95975. Its 95% CrI includes zero.
- Adult ACER, CNAT, ORBI and PCLI have negative regional-difference intervals
  excluding zero. All unsupported regional juvenile/All entries remain blank.
- Figs 4–5 again show equal-habitat temporal trends. Community increases are
  +96.9483% [59.3563%, 147.5706%] for juveniles, +28.6896%
  [9.3601%, 53.7987%] for adults and +61.2311% [39.1686%, 89.8206%]
  combined. These are regressions of source-specific predictions, not a new
  numeric-year model term.
- PEV_overall_equal_habitat_densities.csv is the primary overall summary.
  Survey-averaged adult/juvenile/combined means are .861288/1.085263/1.946550;
  do not confuse them with the 2024 adult total 1.031393.
- Area-weighted sensitivity outputs: TableA3_own_area_sensitivity_numeric.csv,
  regional_weighting_sensitivity.csv, temporal_trends_own_area_sensitivity.csv,
  and PEV_overall_area_weighted_densities.csv. The separate habitat maps and
  taxon-by-habitat review remain supporting records, not new main estimands.
- Habitat-specific densities, colony abundance extrapolations, fit checks,
  original surveys and integrated Fig 1 / Tables 1–2 are unchanged.
- Current equal-habitat Table A3 derived diagnostics: max Rhat 1.003599,
  min bulk ESS 3970.156, min tail ESS 2779.426. The pre-existing
  parameter-mixing and sparse-cell tail caveats remain applicable.
- Validation: equal_habitat_restoration_validation.csv and
  equal_habitat_restoration_preservation.csv. New fitting remains disabled.
- Pre-restoration main source/results are saved locally at
  /Users/rosscunning/Projects/PENIP/old_working_files/coral_equal_habitat_restoration_2026-11-06_152157.

The manuscript is edited manually by the user. Resume Discussion revisions
with equal-habitat estimates; revisit the recently drafted regional Results:
the adult-total 95% CrI now includes zero, and CNAT joins the three other adult
taxa with negative difference intervals. Describe these primary estimates as
habitat-standardized, not weighted by each region's actual habitat areas.

## Superseded area-weighted implementation — historical record

The user's area-weighting decision applies to every manuscript average across
habitats, not only the regional comparison. The two remaining equal-habitat
calculations were the overall PEV density summary and the temporal predictions.
Both now use the PEV Table A1 habitat-area proportions. Temporal weights are
held fixed across years. Available surveys/sources are still equally averaged
within each taxon/class/habitat cell; this is a separate operation.

- Survey-averaged PEV: adult .739574 [.667023, .821265], juvenile 1.284870
  [1.001932, 1.655288], combined 2.024445 [1.730345, 2.411552] colonies/m².
- 2024 PEV: adult .854835 [.689256, 1.055283], juvenile 1.648241
  [1.193971, 2.257376], combined 2.503076 [1.979953, 3.163077] colonies/m².
- New canonical overall-summary file: PEV_overall_area_weighted_densities.csv.
- Figs 4–5 and temporal numeric summaries were regenerated with area weights.
  Habitat-specific Figs 2–3/A2–A3 and abundance extrapolations retain their
  existing calculations. Table A3 and its regional comparisons are unchanged.
- Equal-habitat estimates remain only as explicit sensitivity comparisons.
  Do not carry the old equal-habitat overall means into the manuscript.
- The intermediate source/results before this correction are saved under
  old_working_files/coral_all_habitat_area_transition_2026-11-06/.
- All nine new transition checks and all seven main-pipeline checks passed.
  Independent overall-density summaries match within 6.7e-16; independently
  regressed temporal mean slopes match within 1.4e-17. Only numbered Figs 4–5
  changed. Table A3, habitat-specific densities, abundance outputs, fit checks
  and the fitted posterior are unchanged.
- Current 2017–2024 community changes: juveniles +.694949 [.416191, 1.064991]
  colonies/m², +80.3457% [44.3786%, 129.2160%]; adults +.097069
  [−.021876, .231470], +14.3885% [−2.9201%, 35.7723%]; combined +.792018
  [.466620, 1.195711], +50.7562% [28.4609%, 79.3341%]. The adult-total interval
  now includes zero; do not retain the old claim of clear increases in both
  adults and juveniles.

Discussion revision is at the first paragraph under "Coral densities at Port
Everglades." Correct previously revised overall-density and temporal manuscript
claims as needed after this change. No model refit is required or authorized.

## Earlier own-area regional comparison — superseded

The main Rmd now weights the 2024 PEV and Broward–Miami habitat predictions by
each region's own mapped reef-habitat areas. This is a post-processing change;
the likelihood, priors, observation membership, cached fit and all 4,000 draws
are unchanged. Direction effects remain zero and dataset is drm24.

- Table A3's four PEV habitat columns remain unchanged. Its regional density,
  paired-difference and sign-probability columns use own-area weights.
- PEV areas are the unrounded Table A1 project / monitoring areas, totaling
  4.004754 km². Broader regional areas are the complete map's Broward-Miami
  region outside the 1,200 m N/S band, totaling 79.849767 km². These two PEV
  footprint conventions are not identical; neither was silently replaced.
- Area proportions NRC/IR/MR/OR: PEV .538979/.155253/.109140/.196628;
  broader region .578469/.137876/.109905/.173750.
- Adult total: PEV .854835 [.689256, 1.055283], BM 1.196432
  [1.008739, 1.424450] colonies/m²; paired difference −.341597
  [−.609288, −.075792], Pr(PEV < BM) .992.
- `regional_habitat_area_weights.csv` and its site/overlap audits document
  the weights. The complete 1,868-polygon area input and provenance are under
  data/spatial/drm_regional_habitat; exploratory caches are not required.
- `regional_density_comparison.png/.pdf` is an additional regional figure;
  it is also published to outputs/. At this first regional-only transition,
  numbered PEV figures were unchanged; temporal figures are now updated as
  described in the later correction above.
- `TableA3_equal_habitat_sensitivity_numeric.csv` retains the earlier equal
  weighting. `regional_weighting_sensitivity.csv` contains both estimands.
- Unsupported juvenile / All regional comparisons remain blank; adult totals
  still contain the same 17 modeled taxa.
- The pre-change source, report and Table A3 outputs are preserved locally in
  old_working_files/coral_own_area_transition_2026-11-06/.
- The main coral and integrated reports were regenerated successfully. All 11
  Table A3 checks, seven pipeline checks and nine transition checks pass.
  Every primary supported comparison reproduces the reviewed sensitivity to
  within 2.3e-16; the saved equal-weight sensitivity reproduces the earlier
  Table A3 exactly. At that first transition, all 12 numbered coral PNGs and
  the audited PEV/temporal/abundance/PPC summaries were byte-identical.
- Current own-area comparison diagnostics: max Rhat 1.005712, min bulk ESS
  3881.876, min tail ESS 2869.872. Adult-total sign-probability MCSE .00154.

The manuscript has not been edited automatically. Resume by updating the
regional-comparison Methods and adding the new regional Results, then revise
the Discussion. The convergence caveat below still applies.

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
Current equal-habitat Table A3 density/contrast targets have max Rhat 1.00360,
min bulk ESS about 3,970 and min tail ESS about 2,779. Sparse ACER cell means remain unstable;
one regional adult Middle Reef draw supplies 61% of its mean. No draws removed.
Discuss ACER mixing/regularization before more fitting; no alternative fit is
automatically authorized. All observed 2024 PPC metrics fall within their 95%
replication intervals; this does not by itself establish convergence.

The restored primary equal-habitat comparison gives 2024 adult
density: PEV 1.031393 [0.831459, 1.279704], Broward–Miami 1.307546
[1.107882, 1.547714]; Pr(PEV < BM) .95975. Adult ACER: PEV .00590365
[.00182279, .01476484], BM .02233269 [.00877993, .04999851]; probability .98325.
Current equal-habitat PEV survey-averaged adult/juvenile/combined means
are .8612875/1.0852628/1.9465503; area-weighted values above are sensitivity results.

Preserve region-specific PEV manuscript predictions, zero direction effects,
source effects retained, equal weighting for all main habitat averages, eligible juvenile coverage,
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
