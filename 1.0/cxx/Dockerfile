#################################################################
# Dockerizing GRPC: Dockerfile for building Ubuntu14.04 image with ready to use grpc and proto3
# 
# Based on ubuntu:latest
# 
# Installation apt packages
#   autoconf
#   automake
#   libtool
#   curl
#   unzip
#   make
#   gcc
#   g++
#   build-essential
#   git
#
# Installation from source
#   grpc (https://github.com/grpc)
#################################################################
# author: andyAugustin
# email: andy.augustin@t-online.de
# license: MIT
################################################################i

FROM ubuntu:14.04

MAINTAINER andyAugustin<andy.augustin@t-online.de>

# Install dependent apt packages
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    libtool \
    curl \
    unzip \
    make \
    gcc \
    g++ \
    build-essential \
    git  && apt-get clean

ENV GRPC_RELEASE_TAG release-0_13_1

ENV TMP_DIRECTORY /home/tmp

RUN mkdir ${TMP_DIRECTORY}

# Install grpc
RUN cd ${TMP_DIRECTORY} && git clone https://github.com/grpc/grpc.git && cd ${TMP_DIRECTORY}/grpc \
    && git checkout tags/${GRPC_RELEASE_TAG} \
    && git submodule update --init && make && make install

# Tear down
RUN rm -rf ${TMP_DIRECTORY}


