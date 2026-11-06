# Assessment of the 4,000-draw joint coral run

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

The area-weighted implementation described next is retained as a historical
sensitivity record. The restored primary equal-habitat numerical results also
appear later in this assessment. No posterior was refit or altered.

**Update, 6 November 2026:** the primary regional estimand now uses each
region's own mapped habitat-area proportions. The posterior and convergence
assessment are unchanged. The equal-habitat results from the original fit
assessment are retained below as historical sensitivity results.

## Earlier own-area regional comparison — now sensitivity

All main manuscript averages across habitats now use mapped habitat-area
proportions, including overall PEV densities and temporal predictions. The
same PEV proportions are used in every survey year. Survey/source averaging
within habitat is unchanged. Current survey-averaged PEV adult, juvenile and
combined densities are .739574 [.667023, .821265], 1.284870
[1.001932, 1.655288] and 2.024445 [1.730345, 2.411552] colonies/m².
Their 2024 values are .854835 [.689256, 1.055283], 1.648241
[1.193971, 2.257376] and 2.503076 [1.979953, 3.163077].
See `PEV_overall_area_weighted_densities.csv`.

Area-weighted 2017–2024 changes are +80.35% [44.38%, 129.22%] for juveniles,
+14.39% [−2.92%, 35.77%] for adults and +50.76% [28.46%, 79.33%] combined.
The adult-total change interval now includes zero. Figs 4–5 were regenerated;
the other numbered habitat and abundance figures are unchanged. The saved fit
and regional comparisons below remain unchanged. All nine transition checks
in `all_habitat_area_transition_validation.csv` passed.

Table A3 now uses 4.004754 km² of PEV project / monitoring reef habitats and
79.849767 km² of broader mapped Broward–Miami reef habitats outside the 1,200 m
north/south PEV classification band. Those two PEV footprint conventions are
not identical. NRC/IR/MR/OR area proportions are
.538979/.155253/.109140/.196628 at PEV and
.578469/.137876/.109905/.173750 in the broader region. Mapped areas are fixed.
Predictions still select drm24, retain source effects, set direction effects
to zero and use all 4,000 paired draws.

| 2024 target | PEV mean [95% CrI] | Broward–Miami mean [95% CrI] | Pr(PEV < BM) |
|:--|:--|:--|--:|
| Adult total | 0.854835 [0.689256, 1.055283] | 1.196432 [1.008739, 1.424450] | 0.9920 |
| Adult ACER | 0.012188 [0.003802, 0.030018] | 0.050252 [0.019854, 0.114071] | 0.9885 |

The adult total difference is −0.341597 [−0.609288, −0.075792] colonies/m².
The ACER difference is −0.038064 [−0.101886, −0.005097]. The comparison includes
habitat-composition differences as well as differences within habitats.
Current own-area targets have maximum Rhat 1.005712, minimum bulk ESS 3881.876
and minimum tail ESS 2869.872; adult-total sign-probability MCSE is .00154.
These derived diagnostics do not resolve the model's parameter-level caveat.

All 24 supported primary comparisons reproduce the previously reviewed
own-area sensitivity within 2.3e-16. The saved equal-habitat sensitivity
reproduces the earlier Table A3 exactly. The cached fit, all 12 numbered coral
PNG figures and the audited unaffected PEV/temporal/abundance/PPC numerical
summaries were unchanged at the initial regional-only transition; the later
overall/temporal area-weighting correction is described above. The new regional figure is
`regional_density_comparison.png/.pdf`; Table A3, its notes and weights are
also published to the manuscript output directory. Main and integrated reports
were regenerated. See `own_area_transition_validation.csv`.

## Original sampling-run assessment (3 November 2026)

Completed 3 November 2026. The authorized run and all downstream products are
finished. No sampler or render remains running. This is a useful improvement
over the short pilot, and the main manuscript results are stable. It is still
provisional because some distributional parameters miss the convergence criteria
and a few sparse-cell posterior means remain sensitive to extreme draws.

## Run and reproducibility

The run used four chains, each with 1,000 warmup and 1,000 sampling iterations,
five threads per chain, adapt_delta 0.95, max_treedepth 11, seed 20261026 and
initialization 0. Sampling produced 4,000 retained draws and took 71.3 minutes
at the slowest chain. All retained draws feed densities, contrasts and temporal
trends; PPCs use 250 replicated datasets. No density draws were filtered.

The observations, encodings, formulas, priors and prediction targets match the
revised-prior short pilot exactly. The audit in
historical `run_specification_validation.csv` passed all four checks (retained
in the November development archive). The difference in
runtime cannot isolate the effect of five versus four threads because warmup
and sampling lengths also changed.

The full model is saved at
`models/db9da5156777a9344ac26acd2b9ce2ac/brms_fit.rds`, MD5
`e830a6cb31d99f8620bf6165759bd4d3`. A second, cached-only render generated the
additional diagnostics and comparisons with new fitting explicitly disabled;
the model checksum is unchanged. All 517 protected earlier/original files were
unchanged at that assessment; the subsequent promotion has its own archive manifest
and preservation validation. All six pipeline validation checks pass. These reproducibility
checks are separate from the statistical convergence checks.

## Convergence and predictive checks

| Metric | Revised-prior short pilot | Current run |
|:--|--:|--:|
| Retained posterior draws | 1,000 | 4,000 |
| Maximum parameter R-hat | 1.0969 | 1.0189 |
| Minimum bulk ESS | 30.2 | 266.3 |
| Minimum tail ESS | 68.4 | 531.4 |
| Divergences | 0 | 0 |
| Maximum-depth hits | 0 | 0 |

Two coefficients have R-hat above 1.01: the adult ACER shape coefficient
(1.0189) and adult ACER zero-inflation coefficient (1.0125). Five zi coefficients
or intercepts have bulk ESS below 400. Chain energy diagnostics are reassuring
(E-BFMI 0.800–1.050), and traces overlap, with lingering slow excursions in
ACER's zi/shape parameters. The fitted ACER NRC zi and log-shape combinations
also have R-hat around 1.02. The overall sampling check therefore remains FALSE.

The original equal-habitat Table A3 densities and paired differences mixed much
better: maximum R-hat 1.0036, minimum bulk ESS about 3,970 and minimum tail ESS
about 2,779. These results support stability of the principal estimands, but do
not establish stability of every sparse habitat-cell mean.

All 476 observed 2024 adult PPC metrics and all 272 observed 2024 juvenile
metrics are inside their 95% replication intervals. Across every dataset/class,
51 of 2,268 metrics are outside, versus 52 in the pilot. Older-survey mismatches
remain. Broad posterior predictive intervals and checks using the fitted data
cannot by themselves prove adequate identification or convergence.

## Restored primary equal-habitat results

These are drm24 predictions with explicit region selection, equal weights for
the four habitats, source effects retained and direction effects zero. They
are distinct from survey-averaged manuscript predictions. Adult sums use the
same 17 modeled taxa and preserve covariance within posterior draws.

| 2024 target | PEV mean [95% CrI] | Broward–Miami mean [95% CrI] | Pr(PEV < BM) |
|:--|:--|:--|--:|
| Adult total | 1.0314 [0.8315, 1.2797] | 1.3075 [1.1079, 1.5477] | 0.95975 |
| Adult ACER | 0.005904 [0.001823, 0.014765] | 0.022333 [0.008780, 0.049999] | 0.98325 |

Densities are colonies/m². The adult total difference, PEV minus BM, is
−0.2762 [−0.5693, 0.0299]; its interval includes zero. The ACER difference is
−0.01643 [−0.04387, −0.00131]. Their posterior sign-probability MCSEs are
0.00328 and 0.00204, respectively. These are posterior probabilities, not
p-values. No multiplicity-adjusted significance labels are introduced.

Relative to the pilot, adult totals change −0.10% for PEV and +0.22% for BM.
Median absolute species-mean changes are 0.61% and 1.10%, respectively. The
largest adult taxon change is regional MADR, −7.95%, with substantial remaining
posterior uncertainty. ACER means change +1.29% and +2.15%; its directional
probability changes from 0.979 to 0.98325.

ACER NRC estimates remain stable: PEV 0.02226 [0.00692, 0.05464], BM 0.08623
[0.03402, 0.19627]. The strong NRC versus other-habitat pattern remains.

Survey-averaged PEV adult/juvenile/combined means are 0.86129, 1.08526 and
1.94655 colonies/m²; changes from the pilot are all below 0.17%. The survey-
averaged adult 95% CrI is [0.77965, 0.95331]. Table 2 total means change by at
most 0.182% across zones. Community temporal trends remain effectively the
same: estimated 2017–2024 changes are +28.69% adults, +96.95% juveniles and
+61.23% combined, with positive 95% intervals. One borderline taxon trend
changes its interval-zero label: adult DSTO now narrowly excludes zero, while
its mean change remains almost identical. That boundary crossing should not
be presented as a material new biological finding.

Unsupported regional juvenile/combined comparisons remain blank. PEV has no
2024 Outer Reef observations; that prediction still borrows from other model
components and older surveys.

## Remaining ACER tail problem

The regional adult Middle Reef ACER cell has ten observed 2024 rows, zero
colonies and 200 m² searched. Its posterior median is 0.0000534 colonies/m²,
and its 95% CrI is [0.00000582, 0.002243]. However, its sample mean is 0.002299:
one draw of 5.636 colonies/m² contributes 61.3% of the sum. Mean MCSE is
0.001432, or 62.3% of the mean. Eight half-chain block means range from
0.000289 to 0.01237 while the block medians remain near 0.00005.

This illustrates why good rank R-hat/ESS alone cannot certify a heavy-tailed
mean. The longer run exposed a rare tail; it did not biologically establish
high Middle Reef density. The PEV juvenile ACER Inner Reef mean also has
33.7% relative MCSE and one draw contributing 33.7% of its sum. PEV adult
Middle Reef ACER has 11.3% relative MCSE. Main totals and habitat-averaged ACER
comparisons are much less affected, but these cell means should not be treated
as precise estimates. The median is a useful diagnostic here, not a silent
replacement for the manuscript's chosen mean.

## Recommendation

Keep this saved fit as the current working result. The manuscript's broad
story is stable, and repeating the same calculation does not require another
fit. Before final inference, address the residual ACER zi/shape mixing and
sparse-cell tail identification. More iterations may improve mixing, but
cannot be expected to remove a tail permitted by the model and priors. A
focused review of ACER distributional pooling/regularization is more useful
than automatically launching a much longer fit. Any change should receive
prior predictive and sensitivity checks while retaining the same PEV/BM
prediction targets. No new model or additional fit has been started.

The current report is `coral_analysis.html` under `outputs/coral_analysis/`. Detailed current-fit
evidence is in `parameter_diagnostics.csv`, `density_cell_diagnostics.csv`,
`density_chain_block_stability.csv` and `TableA3_probability_diagnostics.csv`.
The historical pilot-comparison tables, plots and full comparison report are
preserved under `old_working_files/coral_comparison_2026-11-03/`, retaining their
original paths; they are no longer inputs to the current pipeline. The cleanup
does not change the model or numerical estimates summarized above. The Rmd and
runner reuse the saved fit with new fitting disabled. Future new fits write a
live `fit_progress.log` beside the model.
