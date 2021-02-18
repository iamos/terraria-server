FROM debian:buster
# iamos

# Set ENV
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG TERRARIA_VERSION=1412
ARG TMOD_VERSION=0.11.8


# Install packages
RUN apt-get update
RUN apt-get install -y zip wget curl mono-runtime

RUN mkdir /terraria
RUN mkdir /terraria/World
RUN mkdir /terraria/Mods

WORKDIR /terraria

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/042/original/terraria-server-1412.zip
RUN unzip terraria-server-$TERRARIA_VERSION.zip
RUN rm terraria-server-$TERRARIA_VERSION.zip

WORKDIR /terraria/$TERRARIA_VERSION/Linux

RUN wget https://api.github.com/repos/tModLoader/tModLoader/releases/latest -O tMLlatest.json &&\
    tml=`sed -n 's/.*\(https.*Linux.*.tar.gz*\)".*/\1/p' tMLlatest.json` &&\
    wget $tml &&\
    tar xvzf tModLoader.Linux*.tar.gz &&\
    chmod a+x tModLoader tModLoader-* tModLoaderServer *.bin* && \
    rm *.tar.gz tMLlatest.json


# tModServer Settings
COPY ./tmodconfig.txt /terraria/tmodconfig.txt

# RUN Server
ENTRYPOINT ["./tModLoaderServer.bin.x86_64","-config","/terraria/tmodconfig.txt"]
