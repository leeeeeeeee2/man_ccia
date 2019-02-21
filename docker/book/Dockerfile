FROM continuumio/miniconda3

MAINTAINER Conor I. Anderson <conor@conr.ca>

RUN apt-get update -qq &&\
    apt-get -y install --no-install-recommends \
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
          matplotlib \
          netCDF4 \
          pandas \
          python \
          requests \
          r-base \
          "r-bookdown>=0.7" \
          r-plotly \
          r-reticulate \
          scipy \
          "seaborn>=0.9.0" &&\
          conda clean -ya
