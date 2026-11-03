# Current joint coral analysis — 3 November 2026

The current fit and report are complete. Nothing is fitting or rendering.
Use `coral_joint_brms_analysis.Rmd` or `run_4000_draw_comparison.R` in this
directory. Both default to the saved 4,000-draw configuration with new fitting
disabled. Do not start a fit merely to regenerate figures or tables.

## Saved fit

- Output: `outputs/coral_joint_analysis/brms_2024_4000draws/`.
- Model: `models/db9da5156777a9344ac26acd2b9ce2ac/brms_fit.rds` within it.
- Model MD5: `e830a6cb31d99f8620bf6165759bd4d3`.
- Four chains: 1,000 warmup + 1,000 sampling each, five threads/chain.
- adapt_delta .95, depth 11, seed 20261026, initialization 0.
- Sampling runtime 71.3 minutes; 4,000 retained draws.
- Full report: `coral_joint_brms_analysis.html` in the output directory.
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
untouched. The Fig A1 habitat-label error was corrected using explicit factor
order and named labels; model and numerical estimates were unchanged.

## Repository cleanup

Development analyses and outputs are archived in
`old_working_files/coral_comparison_2026-11-03/`, retaining paths, checksums and
prior tracking status. The October archive is also retained. Historical
comparison code was removed from this Rmd after preserving the complete source
and report; the current pipeline has no archive dependency. Shared input data,
original analyses/outputs and the current cached fit remain in place. Check the
archive README and manifest to revisit prior models. Do not run archived scripts
against the active output directory without restoring their intended paths.
