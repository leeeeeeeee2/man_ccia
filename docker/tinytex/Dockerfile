FROM alpine

MAINTAINER Conor I. Anderson <conor@conr.ca>

ENV PATH="/root/bin:${PATH}"

RUN apk add imagemagick perl wget

RUN wget -qO- \
  "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | sh

RUN tlmgr install pgf preview standalone tex xcolor 
