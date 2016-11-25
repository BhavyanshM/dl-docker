#!/bin/bash

# Make sure that the docker containers are up to date
docker build -t winterg/dl-docker -f Dockerfile.gpu .

# Boot the deep learning ipython server on port 8888
nvidia-docker run -it --restart=always -p 8888:8888 -p 6006:6006 -e "PASSWORD=colorizeeverything" -v /media/data:/root/persistant_data winterg/dl-docker
