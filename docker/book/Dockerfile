FROM continuumio/miniconda3

MAINTAINER Conor I. Anderson <conor@conr.ca>

RUN apt-get update -qq &&\
    apt-get -y install --no-install-recommends \
      libgl1-mesa-dev \
      make &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/lib/apt/lists/*

RUN conda config --append channels ConorIA &&\
    conda config --prepend channels conda-forge

RUN conda create -y \
          -n man_ccia \
          matplotlib \
          netCDF4 \
          pandas \
          python \
          r-base \
          "r-bookdown>=0.7" \
          r-canadaHCDx \
          r-reticulate \
          rpy2 \
          scipy \
          seaborn &&\
          conda clean -ya
