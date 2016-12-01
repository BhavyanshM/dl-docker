#!/bin/bash

# Make sure that the docker containers are up to date
sudo docker build -t winterg/dl-docker:opencv -f Dockerfile.gpu .

# Remove old docker image
sudo docker rm -f 'deep-learning-docker'

# Boot the deep learning ipython server on port 8888
sudo nvidia-docker run --name "deep-learning-docker" -it --restart=always -p 8888:8888 -p 6006:6006 -e "PASSWORD=colorizeeverything" -v /media/data:/root/persistant_data winterg/dl-docker:opencv
