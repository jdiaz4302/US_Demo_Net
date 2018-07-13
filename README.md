# Demographics from Space!

A Sentinel-2 based CNN to predict the demographics of US capital cities and to determine spectral bands of demographic importance

### Why are we doing this?

Because generally we use remote sensing (i.e. satellites) to solve the following problems:

1. We can't re-measure often or at a large scale
2. It's expensive to re-measure
3. Our study area is difficult and/or dangerous to reach

And all of these apply to acquiring social variables!

1. The United States Census Bureau surveys, at the finest temporal scale which doesn't include all data, every 1 year. The Sentinel-2 satellite constellation revisits study areas on a 5-day repeat schedule 
2. Census surveys require thousands of employees, meanwhile Sentinel-2 data is provided for free
3. There are lots of rural and/or dangerous neighborhoods which literally have no effect on a satellite

### What exactly are we doing?

Using 12-band satellite imagery in custom-architecture convolutional neural networks to predict the following variables for U.S. capital cities:

1. Population density
2. Unemployment rate 
3. Number of housing units
4. Median household income
5. Average commute time
6. Gini index (a measure of wealth inequality)

Our model architecture also allows us to view which bands are most important (i.e. have the highest weights), so we used these bands via band math in QGIS to prototype social indices (analagous to more traditional indices such as vegetation indices).
