FROM continuumio/anaconda3

MAINTAINER Conor I. Anderson <conor@conr.ca>

RUN apt-get update -qq &&\
    apt-get -y install make &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/lib/apt/lists/*

RUN conda config --append channels ConorIA &&\
    conda config --prepend channels conda-forge

RUN conda create -y \
          -n book \
          pandas \
          python \
          r-base \
          r-bookdown \
          r-canadaHCDx \
          r-reticulate \
          rpy2 &&\
          conda clean -ya
