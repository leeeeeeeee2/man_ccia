FROM continuumio/miniconda3

MAINTAINER Conor I. Anderson <conor@conr.ca>

RUN apt-get update -qq &&\
    apt-get -y install --no-install-recommends \
      curl \
      libgl1-mesa-dev \
      make \
      unzip &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/lib/apt/lists/*

RUN conda config --append channels ConorIA &&\
    conda config --prepend channels conda-forge

RUN conda create -y \
          -n man_ccia \
          ec3 \
          esgf-pyclient \
          matplotlib \
          netCDF4 \
          pandas \
          python \
          requests \
          "r-bookdown>=0.12" \
          r-dplyr \
          r-plotly \
          r-readr \
          "r-reticulate>=1.2.1" \
          r-stringr \
          r-zoo \
          scipy \
          "seaborn>=0.9.0" \
          xarray &&\
          conda clean -ya
