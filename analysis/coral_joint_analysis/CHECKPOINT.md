# Complete single-document joint analysis: completed checkpoint

The latest user request is complete. No fit or render remains running.

Source: analysis/coral_joint_analysis/coral_joint_analysis.Rmd
Guide: analysis/coral_joint_analysis/README.md
Outputs: outputs/coral_joint_analysis/
Report: outputs/coral_joint_analysis/coral_joint_analysis.html
Posterior: outputs/coral_joint_analysis/models/7e2169d606b6259fd362df86804b7731/posterior.rds

The5228-line Rmd has64named chunks, follows the original analysis structure,
and contains the full raw survey imports, GIS preparation, regional adult and
juvenile counting/QC, baseline prior design, embedded Stan program, fit/cache
logic, diagnostics, predictions, main/appendix figures/tables and contrasts.
No original Rmd or earlier R helper scripts are sourced. The Rmd is authoritative;
temporary authoring builders in/private/tmp are not runtime dependencies and
should not overwrite later direct Rmd improvements.

## Verified

- Rebuilt original counts match all14,387original processed CSV rows exactly.
  Full joint input has16,340rows,116cells,29taxon/class combinations,6sources.
- Direct regional preparation matches93added sites x17adult taxa and93x4
  juvenile groups. All juvenile and targeted adult transects are audited;
  allMycetophyllia and routine juvenile effort40m²/site. The2worksheet-only,
  fully recently dead adult records remain documented. No fabricated juveniles.
- Four cache import checks pass: labels/indexing, full likelihood and priors,
  sampling settings, and Stan program. No refit. Posterior saved separately.
- A covariance square root is nonunique. A raw-validated equivalent basis
  retains the cached latent-parameter orientation; local basis references
  under models/prior_bases allow future reuse without older directories.
- Fig1–6,FigA1–6 produced as PNG/PDF. All12PDFs readable single pages. Every
  main/appendix PNG and4extra figures inspected, plus representative PDF.
  Contact sheets and PDF preview are in outputs/coral_joint_analysis/qa/.
- Table1–2,TableA1–A6 and expandedTableA3 generated. output_inventory.csv
  enumerates38required products; all final_validation.csv checks TRUE.
- ExpandedTableA3 exactly matches the previous validated joint-model table;
  HTML has42rows, both probabilities, and blank unsupported regional entries.
- Original Rmd/model/data/original manuscript outputs unchanged; preservation
  checks all TRUE. Full HTML render succeeded. Installed-package/xfun
  deprecation warnings do not represent a render or numerical validation error.

## Scientific choices

PEV=1200mN/S from channel bounding edges, all sources/both classes. All1069
modeled site-surveys match original zone-union membership, although geometric
outlines differ. Added regional data are DRM2024 only. Original adult/juvenile
likelihood and baseline priors retained; regional mean/zi/shape deviations
and regional direction SDs extend the model. Source effects are shared.

Manuscript predictions explicitly select PEV, retain source effects, and set
direction effects zero. Survey averaging retains original source coverage;
2024 predictions use drm24. Colony totals use unrounded GIS habitat areas.
Original Table2 Total-doubling arithmetic corrected. Treemap colors fixed.
Legacy Table1/maps describe the original cohort; joint_survey_summary.csv
reports geographic membership. Raw-versus-modeled FigureA1 uses PEV data only.

RegionalTableA3: paired differences/pointwise95%CrIs and both posterior sign
probabilities, no p-values/multiplicity adjustment/significance labels. Other
juvenile/All regional entries blank. MCAVAll and4-group juvenile subtotal
comparable; total adults sum17modeled taxa. Finite-draw0/1is not certainty.

## Pilot status and rerunning

Fit is still the completed pilot:4chains,500warmup+500sampling,2threads,
adapt_delta.95,maxdepth11,seed20261026. MaxRhat1.023188,minbulkESS92.2,mintail170,
zero divergences/depth hits. The document explicitly marks results provisional.
A completed report does not mean final manuscript sampling is completed.
No new long fit was requested in this turn.

From PENIP root:

    rmarkdown::render("analysis/coral_joint_analysis/coral_joint_analysis.Rmd",
      output_dir="outputs/coral_joint_analysis",knit_root_dir=getwd())

Matching cache reused. YAML allow_new_fit defaultsFALSE. To sample from scratch
or run longer chains, change sampling/warmup/controls and enable allow_new_fit.
A new signature saves to a different model folder. Posterior saved immediately
on sampling completion, before downstream figures/report can fail.
