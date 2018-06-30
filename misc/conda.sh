#!/bin/bash

function build(){
  source /opt/anaconda/bin/activate
  cd misc/conda/conda-recipies
  for dir in $(ls .)
  do
    cd "${dir}"
    conda build --token "${condaPAT}" --user ConorIA .
    cd ..
  done
}

function convert(){
  source /opt/anaconda/bin/activate
  for tarball in $(ls /data/conda-bld/linux-64/*.tar.bz2)
  do
    conda convert "${tarball}" -p osx-64 -o /data/conda-bld
  done
  for tarball in $(ls /data/conda-bld/osx-64/*.tar.bz2)
  do
    anaconda upload "${tarball}"
  done
}

$1
