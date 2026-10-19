# Regional habitat snapshot for the 2024 DRM comparison

This folder preserves the public Southeast Florida benthic-map polygons intersecting all 179 Southeast Florida sites in `data/full_drm_2024/2024.RData` at the time of retrieval (2026-10-19). These are 93 complete source polygons, not an extraction of the whole regional dataset. `snapshot_site_coordinates.csv` records the query footprint.

Source: [FDEP Southeast Florida Benthic Habitats service](https://services1.arcgis.com/nRHtyn3uE1kyzoYc/arcgis/rest/services/SE_Florida_Benthic_Habitats/FeatureServer/0), layer `SE_FL_Benthic_Habitats_10Nov2015_PBunion`. [FWC metadata](https://archive.myfwc.com/archive/Research/GIS/se-fl-benthic-habitats.pdf) credits Walker and Klug (2014), Cumming (2017), and preceding regional mapping efforts. Full service metadata and a content checksum are retained here.

The source preserves the original `Type`, `Modifier`, `Region`, and `Type2` attributes used by the project KML's classification system. Layer boundaries are not identical to the KML everywhere: at the regional DRM coordinate, PEV site AA3075 is Sand here but Inner Reef in the project KML. The comparison retains all existing PEV model assignments.

`analysis/drm_regional_comparison.Rmd` joins the regional sites to this snapshot; it does not download fresh polygons or silently assign sites outside its cached coordinate footprint. If the DRM coordinates change, refresh the snapshot explicitly. It retains four reef classes, pools Artificial with NRC and Aggregated Patch Reef with Outer Reef, and excludes other source classes. DRM PTCH sites remain explicitly excluded as requested, including one that maps to Inner Reef in this source.
