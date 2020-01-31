FROM ubuntu

RUN apt-get update -y \
    && apt install -y software-properties-common \
    && add-apt-repository universe \
    && apt-get update -y \
    && apt-get install -y bash curl gfortran libnetcdff-dev perl

# Install FCM Make
ENV FCM_VN=2019.09.0
WORKDIR /opt
RUN curl -L "https://github.com/metomi/fcm/archive/${FCM_VN}.tar.gz" | tar -xz
RUN ln -s "fcm-${FCM_VN}" '/opt/fcm' \
    && cp -p '/opt/fcm/usr/bin/fcm' '/usr/local/bin/fcm'
CMD bash

LABEL description="Ubuntu + GFfortran + FCM Make + netCDF" \
      maintainer="matthew.shin@metoffice.gov.uk" \
      version="1"
