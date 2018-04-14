


# Packages
library(raster)


# Setting files
blue_file <- 'US_Demo_Net/Images/Wyoming/T13TEF_20180330T173909_B02.jp2'
green_file <- 'US_Demo_Net/Images/Wyoming/T13TEF_20180330T173909_B03.jp2'
red_file <-'US_Demo_Net/Images/Wyoming/T13TEF_20180330T173909_B04.jp2'


# Import images
s2_B <- brick(blue_file)
s2_G <- brick(green_file)
s2_R <- brick(red_file)


# This lets us know its utm coordinates
crs(s2_B)


# City coordinates from google
easting <- as.integer(515085.73)
northing <- as.integer(4554311.93)


# Setting the cropping extent so that we get 500x500
cropping_extent <- extent(easting - 250,
                          easting + 250,
                          northing - 250,
                          northing + 250)


# Cropping
B_cropped <- raster::crop(s2_B, cropping_extent)
G_cropped <- raster::crop(s2_G, cropping_extent)
R_cropped <- raster::crop(s2_R, cropping_extent)


# Stacking the 3 bands
RGB_stack <- stack(R_cropped, G_cropped, B_cropped)


# Plotting
plotRGB(RGB_stack, scale = 2^12)


