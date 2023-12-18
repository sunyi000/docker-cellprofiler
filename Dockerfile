FROM jlesage/baseimage-gui:ubuntu-20.04-v4.5.2 AS build

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Berlin
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
RUN apt-get update -y && apt-get install -qqy build-essential 

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
RUN apt install -y locales
RUN locale-gen en_US
RUN locale-gen en_US.UTF-8
RUN update-locale

RUN apt-get -qq install -y --no-install-recommends tzdata apt-utils
RUN apt-get install -y make gcc build-essential libgtk-3-dev wget unzip

RUN apt-get install -y python-is-python3 python3-pip openjdk-11-jdk-headless default-libmysqlclient-dev git 
RUN apt-get install -y libnotify-dev --no-install-recommends
RUN apt-get install -y libsdl2-dev

RUN apt-get clean 
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

WORKDIR /tmp


RUN wget https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-20.04/wxPython-4.1.0-cp38-cp38-linux_x86_64.whl
RUN pip3 install wxPython-4.1.0-cp38-cp38-linux_x86_64.whl
WORKDIR /opt
RUN git clone --branch v4.2.6 https://github.com/CellProfiler/CellProfiler.git

WORKDIR /opt/CellProfiler
RUN pip3 install .


EXPOSE 5800

COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh

ENV APP_NAME="CellProfiler"


ENV TAKE_CONFIG_OWNERSHIP=1


WORKDIR /config
