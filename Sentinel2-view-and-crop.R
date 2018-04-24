


# Packages
library(raster)


# WHERE TO SET THINGS UP AT
# City name - for creating output file names
city_name <- 'Madison'
# File names - for importing, everything up until the BXX.jp2
generic_file_path <- '/home/jeremy/Downloads/MadisonWisconsin/S2A_MSIL1C_20180419T164901_N0206_R026_T15TYH_20180419T203149.SAFE/GRANULE/L1C_T15TYH_A014752_20180419T170012/IMG_DATA/T15TYH_20180419T164901_'
# Dont actually change these BXs
B1 <- paste0(generic_file_path, 'B01.jp2')
B2 <- paste0(generic_file_path, 'B02.jp2')
B3 <- paste0(generic_file_path, 'B03.jp2')
B4 <- paste0(generic_file_path, 'B04.jp2')
B5 <- paste0(generic_file_path, 'B05.jp2')
B6 <- paste0(generic_file_path, 'B06.jp2')
B7 <- paste0(generic_file_path, 'B07.jp2')
B8 <- paste0(generic_file_path, 'B08.jp2')
B9 <- paste0(generic_file_path, 'B09.jp2')
B10 <- paste0(generic_file_path, 'B10.jp2')
B11 <- paste0(generic_file_path, 'B11.jp2')
B12 <- paste0(generic_file_path, 'B12.jp2')
# Do change these
# Capital coordinates - for cropping
northing <- as.integer(4775279.73)
easting <- as.integer(794343.09)


# Import images
s2_B1 <- raster(B1)
s2_B2 <- raster(B2)
s2_B3 <- raster(B3)
s2_B4 <- raster(B4)
s2_B5 <- raster(B5)
s2_B6 <- raster(B6)
s2_B7 <- raster(B7)
s2_B8 <- raster(B8)
s2_B9 <- raster(B9)
s2_B10 <- raster(B10)
s2_B11 <- raster(B11)
s2_B12 <- raster(B12)


# Setting the cropping extent so that we get 500x500
# 250 pixels in each direction from the center 
# Times the spatial resolution of 10m
cropping_extent <- extent(easting - 250*10,
                          easting + 250*10,
                          northing - 250*10,
                          northing + 250*10)


# Cropping
B1_cropped<- raster::crop(s2_B1, cropping_extent)
# Fixing the cropping extent issue
new_cropping_extent <- extent(B1_cropped)
# Continued cropping
B2_cropped <- raster::crop(s2_B2, new_cropping_extent)
B3_cropped <- raster::crop(s2_B3, new_cropping_extent)
B4_cropped <- raster::crop(s2_B4, new_cropping_extent)
B5_cropped<- raster::crop(s2_B5, new_cropping_extent)
B6_cropped<- raster::crop(s2_B6, new_cropping_extent)
B7_cropped<- raster::crop(s2_B7, new_cropping_extent)
B8_cropped<- raster::crop(s2_B8, new_cropping_extent)
B9_cropped<- raster::crop(s2_B9, new_cropping_extent)
B10_cropped<- raster::crop(s2_B10, new_cropping_extent)
B11_cropped<- raster::crop(s2_B11, new_cropping_extent)
B12_cropped<- raster::crop(s2_B12, new_cropping_extent)


# Stacking bands by like spatial resolutions
ten_meter_bands <- stack(B2_cropped, B3_cropped, B4_cropped,
                         B8_cropped)
twenty_meter_bands <- stack(B5_cropped, B6_cropped, B7_cropped,
                            B11_cropped, B12_cropped)
sixty_meter_bands <- stack(B1_cropped, B9_cropped, B10_cropped)


# Saving stacks
# Getting the generic output file path for the city
filepath <- paste0('/home/jeremy/US_Demo_Net/Images/', city_name, "/",city_name)
# Setting a specific file path for the city and the resolution
filepath10 <- paste0(filepath, '10.tif')
filepath20 <- paste0(filepath, '20.tif')
filepath60 <- paste0(filepath, '60.tif')
# Write the output files
writeRaster(ten_meter_bands, filepath10,
            format = "GTiff", overwrite = TRUE)
writeRaster(twenty_meter_bands, filepath20,
            format = "GTiff", overwrite = TRUE)
writeRaster(sixty_meter_bands, filepath60,
            format = "GTiff", overwrite = TRUE)


