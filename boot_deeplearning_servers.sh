#!/bin/bash

# Make sure that the docker containers are up to date
cd dl-docker
docker build -t floydhub/dl-docker:gpu -f Dockerfile.gpu .
cd ../

# Boot the server on port 8888
nvidia-docker run -it -p 8888:8888 -p 6006:6006 -e "PASSWORD=colorizeeverything" -v /media/data:/root/persistant_data floydhub/dl-docker:gpu

# Boot the Caffe server on port 4000
