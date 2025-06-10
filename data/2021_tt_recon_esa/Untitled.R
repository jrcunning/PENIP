library(sf)
library(dplyr)

# Step 1: Read the shapefile (still in projected CRS)
shapefile_path <- "~/Downloads/RECON Shapefiles/PortEverglades_RECON_transects.shp"
shp_data <- st_read(shapefile_path)

# Step 2: Sample midpoint in projected space
midpoints_proj <- shp_data %>%
  mutate(geometry = st_line_sample(geometry, sample = 0.5, type = "regular")) %>%
  st_cast("POINT")

# Step 3: Transform midpoints to GPS coordinates (WGS84)
midpoints_wgs <- st_transform(midpoints_proj, crs = 4326)

# Step 4: Extract lat/lon
midpoints_df <- midpoints_wgs %>%
  mutate(
    lon = st_coordinates(.)[,1],
    lat = st_coordinates(.)[,2]
  )

# Optional: View or save
head(midpoints_df)
write.csv(st_drop_geometry(midpoints_df), "midpoints_latlon.csv", row.names = FALSE)
