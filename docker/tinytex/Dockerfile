FROM alpine:edge

MAINTAINER Conor I. Anderson <conor@conr.ca>

ENV PATH="/root/bin:${PATH}"

RUN apk add curl imagemagick perl wget xz

RUN wget -qO- \
  "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | sh

RUN tlmgr install epstopdf-pkg pgf preview standalone tex xcolor 
