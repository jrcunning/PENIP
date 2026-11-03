# Completed 4,000-draw run

Read CHECKPOINT.md for current paths, scientific limitations and repository
organization. The model remains
`db9da5156777a9344ac26acd2b9ce2ac`, MD5
`e830a6cb31d99f8620bf6165759bd4d3`. Four chains completed 1,000 warmup and
1,000 sampling iterations each with five threads/chain. It took 71.3 minutes.
The complete posterior and individual chain CSVs remain in the current output
directory. No fit or render is active.

The full execution log, pilot comparisons, original checksums and earlier
version of this checkpoint are preserved in
`old_working_files/coral_comparison_2026-11-03/`, including snapshots of the
pre-cleanup active source and report. Earlier pilots and the joint Stan model
are archived alongside their outputs. The current Rmd has no dependency on them.

The fit is provisional: two parameter Rhat values exceed 1.01 and five zi
parameters have bulk ESS below 400. Expected-density contrasts mix much better.
Regional adult ACER Middle Reef has mean .00229850, median .00005342 and 95% CrI
[.000005825, .002242806]; one draw of 5.636397 supplies 61.3% of the sum, with
62.3% relative mean MCSE. PEV juvenile ACER Inner Reef mean MCSE is 33.7%; PEV
adult ACER Middle Reef is 11.3%. Do not filter draws or silently substitute
medians. Review the identification/regularization issue before another fit.

Future new fits write a live `fit_progress.log` beside the model, including
during an R Markdown render. A matching saved fit is always reused. Both the
Rmd and runner have new fitting disabled by default.
