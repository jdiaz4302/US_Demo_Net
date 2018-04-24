# US_Demo_Net
A Sentinel-2 based CNN to predict the demographics of US capital cities


### Getting started

Once you get to the jupyter notebook stage, which imports the raster stacks and develops the CNN, you will likely want to use the docker image. Run the following to do so:

`sudo docker build US_Demo_Net/cnn_environment/` \
`sudo docker images` (to get the image ID) \
`sudo docker run -v LocalPathToGitRepo:/data/ -p 8888:8888 ImageID`
