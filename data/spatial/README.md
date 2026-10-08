# Spatial inputs

The project habitat KML, impact-zone KML, NMFS consideration-area KML,
and Kristin Jacobs Coral Aquatic Preserve GeoPackage are retained here.

## Regional coastline

`SE_Florida_coast.gpkg` is a 128 KiB regional subset of GSHHG 2.3.7
(June 15, 2017), full-resolution level-1 land polygons. Both Figure 1
pipelines read this file directly; no GSHHG download is required.

Source archive: http://www.soest.hawaii.edu/pwessel/gshhg/gshhg-shp-2.3.7.zip
Source layer: `GSHHS_shp/f/GSHHS_f_L1.shp`

The subset was created on 2026-10-08 with R/sf in EPSG:4326, with s2
disabled: select polygons intersecting the bounding box, apply
`st_make_valid()`, intersect with the box, and retain polygon geometry.
The bounds are longitude -80.45 to -79.67 and latitude 25.55 to 26.55.
This covers both current map extents with padding. No simplification was
applied; the output contains 33 features and retains source attributes.
If map extents expand beyond these bounds, regenerate a larger subset.

GSHHG is distributed under LGPL version 3 or later. The source archive's
license notice and LGPL text are retained as `GSHHG_LICENSE.TXT` and
`GSHHG_COPYING.LESSERv3`.

The global `gshhg/` extraction and `gshhg.zip` remain ignored by Git;
they are not required for routine rendering. The Florida inset continues
to use the existing rnaturalearth/rnaturalearthdata package dependency.
