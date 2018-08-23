# Demographics from Space!

#### A project by Jeremy Diaz (https://github.com/jdiaz4302) and Ellen Considine (https://github.com/EllenConsidine)
##### Final project for GEOG/GEOL 4093/5093 - Remote Sensing of the Environment

<br>

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

### What does Sentinel-2 imagery look like?

Here is the 10m resolution, blue-band imagery for Albany, NY.

![Sentinel-2 imagery](https://github.com/jdiaz4302/US_Demo_Net/blob/master/README-images/example-model-input.png)

### How good are the predictions?

For the most part, we got impressive results. Below is the plot of predicted population density against true population density, including both training and test set (out-of-sample) examples:

![model results](https://github.com/jdiaz4302/US_Demo_Net/blob/master/README-images/example-model-performance-pop.png)

### Can we create a remote sensing index from this?

As a matter of fact we can! Our model architecture is designed such that we can a idea of how important individual spectral bands are in influencing the prediction. We take those important bands and do some band math in QGIS and get the following index image (and a NDVI image on the right for comparison):

![index results](https://github.com/jdiaz4302/US_Demo_Net/blob/master/README-images/evaluating-our-index.png) ![NDVI comparison](https://github.com/jdiaz4302/US_Demo_Net/blob/master/README-images/evaluating-NDVI.png)

For reference, this is the RGB view:

![rgb reference](https://github.com/jdiaz4302/US_Demo_Net/blob/master/README-images/evaluating-RGB.png)

Careful evaluation will reveal that our index highlights the man-made structures and domestic vegetation, while dampening the water and natural vegetation.

### Concluding remarks

Our custom CNN architecture was able to make impressive predictions for demographics of US cities *and* it also allowed us to create a new index (normalized differenced population index) which highlights pixels which positively contribute to expected population density.
