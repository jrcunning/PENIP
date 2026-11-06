# Regional habitat snapshot for the 2024 DRM comparison

This folder preserves the public Southeast Florida benthic-map polygons intersecting all 179 Southeast Florida sites in `data/full_drm_2024/2024.RData` at the time of retrieval (2026-10-19). These are 93 complete source polygons, not an extraction of the whole regional dataset. `snapshot_site_coordinates.csv` records the query footprint.

Source: [FDEP Southeast Florida Benthic Habitats service](https://services1.arcgis.com/nRHtyn3uE1kyzoYc/arcgis/rest/services/SE_Florida_Benthic_Habitats/FeatureServer/0), layer `SE_FL_Benthic_Habitats_10Nov2015_PBunion`. [FWC metadata](https://archive.myfwc.com/archive/Research/GIS/se-fl-benthic-habitats.pdf) credits Walker and Klug (2014), Cumming (2017), and preceding regional mapping efforts. Full service metadata and a content checksum are retained here.

## Complete Broward–Miami area source

`broward_miami_full_region.gpkg` preserves **all 1,868 source polygons** with
`Region = "Broward-Miami"` from the complete 9,110-feature map retrieved on
2026-10-20. This is a complete mapped-region subset, not a subset selected by
survey-site intersections. All original habitat classes and attributes are
retained, before habitat pooling, overlap treatment or PEV-band removal.
`broward_miami_full_region_provenance.json` records both its checksum and the
full-layer checksum and retrieval metadata. This input was saved on 2026-11-06.

The current `analysis/coral_analysis.Rmd` reads this file to calculate regional
reef-habitat areas for the own-area sensitivity comparison. The primary
regional comparison gives the four reef habitats equal weight. It pools
Artificial with NRC and Aggregated Patch Reef with OR, retains the four modeled
reef classes, dissolves within-class overlaps, omits small areas with conflicting
reef-class labels, and removes the 1,200 m north/south PEV classification band.
All 138 raw 2024 DRM Broward–Miami sites are checked against the source map's
region label. The original 93-feature `habitat_polygons.geojson` remains the
unchanged input for classifying added survey sites.

The source preserves the original `Type`, `Modifier`, `Region`, and `Type2` attributes used by the project KML's classification system. Layer boundaries are not identical to the KML everywhere: at the regional DRM coordinate, PEV site AA3075 is Sand here but Inner Reef in the project KML. The comparison retains all existing PEV model assignments.

## Complete map for geographic review

The earlier geographic-review scripts are preserved locally under
`old_working_files/coral_comparison_2026-10-28/analysis/`.
`download_drm_habitat_map.py` downloaded the complete source layer into the
ignored `outputs/cache/drm_regional_comparison/habitat_full_region/` directory,
verified the source edit metadata and polygon IDs, and recorded checksums and
retrieval provenance. These exploratory scripts are not dependencies of the
current main analysis.

The complete layer retrieved on 2026-10-20 contains 9,110 polygons. All 93 snapshot geometries match their corresponding full-layer geometries exactly. The full layer adds overlapping Sand polygons at sites 1072, 1083 and 1084; accepted reef classes and all effective four-habitat assignments remain unchanged under the existing reef-over-Sand precedence rule.

The archived `drm_habitat_geography_review.R` produced an interactive full
habitat map, a geographic atlas and site-support tables. Additional habitat
area and weighting reviews from 6 November are preserved under
`old_working_files/manuscript_explorations_2026-11-06/`. These archives are
local and ignored by Git. The complete Broward–Miami input above and the
main pipeline's sensitivity summaries remain version-tracked.

The current `analysis/coral_analysis.Rmd` joins the added regional sites to the
93-feature snapshot; it does not download fresh polygons or silently assign
sites outside its cached coordinate footprint. If the DRM coordinates change,
refresh the snapshot explicitly. It retains four reef classes, pools Artificial
with NRC and Aggregated Patch Reef with Outer Reef, and excludes other source
classes. DRM PTCH sites remain explicitly excluded as requested, including one
that maps to Inner Reef in this source.
