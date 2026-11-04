# Regional habitat snapshot for the 2024 DRM comparison

This folder preserves the public Southeast Florida benthic-map polygons intersecting all 179 Southeast Florida sites in `data/full_drm_2024/2024.RData` at the time of retrieval (2026-10-19). These are 93 complete source polygons, not an extraction of the whole regional dataset. `snapshot_site_coordinates.csv` records the query footprint.

Source: [FDEP Southeast Florida Benthic Habitats service](https://services1.arcgis.com/nRHtyn3uE1kyzoYc/arcgis/rest/services/SE_Florida_Benthic_Habitats/FeatureServer/0), layer `SE_FL_Benthic_Habitats_10Nov2015_PBunion`. [FWC metadata](https://archive.myfwc.com/archive/Research/GIS/se-fl-benthic-habitats.pdf) credits Walker and Klug (2014), Cumming (2017), and preceding regional mapping efforts. Full service metadata and a content checksum are retained here.

The source preserves the original `Type`, `Modifier`, `Region`, and `Type2` attributes used by the project KML's classification system. Layer boundaries are not identical to the KML everywhere: at the regional DRM coordinate, PEV site AA3075 is Sand here but Inner Reef in the project KML. The comparison retains all existing PEV model assignments.

## Complete map for geographic review

`analysis/download_drm_habitat_map.py` downloads the complete source layer into the ignored `outputs/cache/drm_regional_comparison/habitat_full_region/` directory. It verifies the source edit metadata against this analysis snapshot, checks that all expected polygon IDs are present exactly once, and records a SHA-256 checksum and retrieval provenance. It does not replace this folder's analysis inputs.

The complete layer retrieved on 2026-10-20 contains 9,110 polygons. All 93 snapshot geometries match their corresponding full-layer geometries exactly. The full layer adds overlapping Sand polygons at sites 1072, 1083 and 1084; accepted reef classes and all effective four-habitat assignments remain unchanged under the existing reef-over-Sand precedence rule.

From the project root, run:

```sh
python3 analysis/download_drm_habitat_map.py
Rscript analysis/drm_habitat_geography_review.R
```

The review produces an interactive full habitat map, a four-panel geographic atlas, a PEV detail map, and county/subregion support tables under `outputs/drm_regional_comparison/`. Spatial joins use the original polygons; map rendering uses 2 m simplification. County names come from the habitat layer's `County` field. DRM subregions and mapped ecological regions are preserved separately. Additional Biscayne sites within the full map extent are shown only as optional context and do not enter the current reference sample. No models are refit and no habitat assignments are changed.

`analysis/drm_regional_comparison.Rmd` joins the regional sites to this snapshot; it does not download fresh polygons or silently assign sites outside its cached coordinate footprint. If the DRM coordinates change, refresh the snapshot explicitly. It retains four reef classes, pools Artificial with NRC and Aggregated Patch Reef with Outer Reef, and excludes other source classes. DRM PTCH sites remain explicitly excluded as requested, including one that maps to Inner Reef in this source.
