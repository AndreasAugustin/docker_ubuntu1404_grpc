#################################################################
# Dockerizing GRPC: Dockerfile for building Ubuntu14.04 image with ready to use grpc and proto3
# 
# Based on ubuntu:latest
# 
# Installation apt packages
#	autoconf
#	automake
#	libtool
#	curl
#	unzip
# 	make
#	gcc
#	g++
#	build-essential	
#	git
#
# Installation from source
#	protobuf version 3 (https://github.com/google/protobuf)
#	grpc (https://github.com/grpc)
#################################################################
# author: andyAugustin
# email: andy.augustin@t-online.de
# license: MIT
################################################################i

FROM ubuntu:latest

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


ENV TMP_DIRECTORY /home/tmp

RUN mkdir ${TMP_DIRECTORY}

# Install proto3
RUN cd ${TMP_DIRECTORY} && git clone https://github.com/google/protobuf.git && cd ${TMP_DIRECTORY}/protobuf \ 
	&& ./autogen.sh && ./configure && make && make check && make install && ldconfig

# Install grpc
RUN cd ${TMP_DIRECTORY} && git clone https://github.com/grpc/grpc.git && cd ${TMP_DIRECTORY}/grpc \
	&& git submodule update --init && make && make install

# Tear down
RUN rm -rf ${TMP_DIRECTORY}

