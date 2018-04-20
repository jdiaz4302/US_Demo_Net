


# Packages
library(raster)


# WHERE TO SET THINGS UP AT
# City name - for creating output file names
city_name <- 'Denver'
# File names - for importing
B1 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B01.jp2'
B2 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B02.jp2'
B3 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B03.jp2'
B4 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B04.jp2'
B5 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B05.jp2'
B6 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B06.jp2'
B7 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B07.jp2'
B8 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B08.jp2'
B9 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B09.jp2'
B10 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B10.jp2'
B11 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B11.jp2'
B12 <- 'US_Demo_Net/Images/Denver/S2A_MSIL1C_20180414T173901_N0206_R098_T13TDE_20180414T212337.SAFE/GRANULE/L1C_T13TDE_A014681_20180414T174725/IMG_DATA/T13TDE_20180414T173901_B12.jp2'
# Capital coordinates - for cropping
northing <- as.integer(4399127.19)
easting <- as.integer(500725.62)


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
filepath <- paste0('US_Demo_Net/Images/', city_name, "/",city_name)
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


