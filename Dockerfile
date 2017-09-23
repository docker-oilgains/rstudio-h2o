FROM f0nzie/rstudio
MAINTAINER Alfonso Reyes

# install python-dev. This affects the .so library loading
RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## used to build rJava and other packages
    libbz2-dev \
    libicu-dev \
    liblzma-dev

# h2o dependencies
RUN install2.r --error \
    statmod \
    rjson \
    RCurl

# install from source
RUN R -e "install.packages('h2o', type='source', repos='http://h2o-release.s3.amazonaws.com/h2o/rel-shannon/8/R')"
