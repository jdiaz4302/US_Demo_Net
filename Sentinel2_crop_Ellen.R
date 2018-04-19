# Packages
library(raster)

#Washington DC:
B1<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B01.jp2'
blue_file <- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B02.jp2'
green_file <- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B03.jp2'
red_file <- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B04.jp2'
B5<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B05.jp2'
B6<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B06.jp2'
B7<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B07.jp2'
B8<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B08.jp2'
B9<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B09.jp2'
B10<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B10.jp2'
B11<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B11.jp2'
B12<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_B12.jp2'
B13<- '~/OneDrive/MyDocs/CU Spring 2018/GEOG 4093 Remote Sensing Project/Wash_DC/T18SUJ_20180126T155519_TCI.jp2'


# Import images
s2_B1<- raster(B1)
s2_Blue <- raster(blue_file)
s2_Green <- raster(green_file)
s2_Red <- raster(red_file)
s2_B5<- raster(B5)
s2_B6<- raster(B6)
s2_B7<- raster(B7)
s2_B8<- raster(B8)
s2_B9<- raster(B9)
s2_B10<- raster(B10)
s2_B11<- raster(B11)
s2_B12<- raster(B12)
s2_B13<- raster(B13)

# This lets us know its utm coordinates
crs(s2_B1)

# City coordinates from google (in UTM): https://www.latlong.net/lat-long-utm.html 
northing <- as.integer(4306480.51)
easting <- as.integer(325760.06)


# Setting the cropping extent so that we get 500x500
cropping_extent <- extent(easting - 250,
                          easting + 250,
                          northing - 250,
                          northing + 250)

# Cropping
Blue_cropped <- raster::crop(s2_Blue, cropping_extent)
Green_cropped <- raster::crop(s2_Green, cropping_extent)
Red_cropped <- raster::crop(s2_Red, cropping_extent)
B1_cropped<- raster::crop(s2_B1, cropping_extent)
B5_cropped<- raster::crop(s2_B5, cropping_extent)
B6_cropped<- raster::crop(s2_B6, cropping_extent)
B7_cropped<- raster::crop(s2_B7, cropping_extent)
B8_cropped<- raster::crop(s2_B8, cropping_extent)
B9_cropped<- raster::crop(s2_B9, cropping_extent)
B10_cropped<- raster::crop(s2_B10, cropping_extent)
B11_cropped<- raster::crop(s2_B11, cropping_extent)
B12_cropped<- raster::crop(s2_B12, cropping_extent)
B13_cropped<- raster::crop(s2_B13, cropping_extent)

#Fixing the extent mismatch
e1<- max(extent(Red_cropped)[1], extent(B1_cropped)[1], extent(B5_cropped)[1],
         extent(B6_cropped)[1], extent(B7_cropped)[1], extent(B8_cropped)[1],
         extent(B9_cropped)[1], extent(B10_cropped)[1], extent(B11_cropped)[1],
         extent(B12_cropped)[1], extent(B13_cropped)[1])
e2<- min(extent(Red_cropped)[2], extent(B1_cropped)[2], extent(B5_cropped)[2],
         extent(B6_cropped)[2], extent(B7_cropped)[2], extent(B8_cropped)[2],
         extent(B9_cropped)[2], extent(B10_cropped)[2], extent(B11_cropped)[2],
         extent(B12_cropped)[2], extent(B13_cropped)[2])
e3<- max(extent(Red_cropped)[3], extent(B1_cropped)[3], extent(B5_cropped)[3],
         extent(B6_cropped)[3], extent(B7_cropped)[3], extent(B8_cropped)[3],
         extent(B9_cropped)[3], extent(B10_cropped)[3], extent(B11_cropped)[3],
         extent(B12_cropped)[3], extent(B13_cropped)[3])
e4<- min(extent(Red_cropped)[4], extent(B1_cropped)[4], extent(B5_cropped)[4],
         extent(B6_cropped)[4], extent(B7_cropped)[4], extent(B8_cropped)[4],
         extent(B9_cropped)[4], extent(B10_cropped)[4], extent(B11_cropped)[4],
         extent(B12_cropped)[4], extent(B13_cropped)[4])
  dimMin<- e2 - e1
  if(e2 - e1 > e4 - e3){
    dimMin<- e4 - e3
  }

  cropping_extent2 <- extent(e1, e1 + dimMin,
                            e3, e3 + dimMin)
  Blue_cropped <- raster::crop(s2_Blue, cropping_extent2)
  Green_cropped <- raster::crop(s2_Green, cropping_extent2)
  Red_cropped <- raster::crop(s2_Red, cropping_extent2)
  B1_cropped<- raster::crop(s2_B1, cropping_extent2) #why is this one weird?
  B5_cropped<- raster::crop(s2_B5, cropping_extent2)
  B6_cropped<- raster::crop(s2_B6, cropping_extent2)
  B7_cropped<- raster::crop(s2_B7, cropping_extent2)
  B8_cropped<- raster::crop(s2_B8, cropping_extent2)
  B9_cropped<- raster::crop(s2_B9, cropping_extent2)
  B10_cropped<- raster::crop(s2_B10, cropping_extent2)
  B11_cropped<- raster::crop(s2_B11, cropping_extent2)
  B12_cropped<- raster::crop(s2_B12, cropping_extent2)
  B13_cropped<- raster::crop(s2_B13, cropping_extent2)


# Stacking the bands
RGB_stack <- stack(Red_cropped, Green_cropped, Blue_cropped)
All_stack <- stack(#B1_cropped,
  Red_cropped, Green_cropped, Blue_cropped, B5_cropped, B6_cropped,
                   B7_cropped, B8_cropped, B9_cropped, B10_cropped, B11_cropped, 
                   B12_cropped, B13_cropped) #Now getting "different number of columns"

# Plotting RGB only
plotRGB(RGB_stack, scale = 2^12)

writeRaster(All_stack, "Washington_DC.grd") #could also write to .tif

