FROM ubuntu:focal
LABEL maintainer="ohseok158@gmail.com"

# Set ENV
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG TERRARIA_VERSION=1423

# Install packages
RUN apt-get update
RUN apt-get install -y zip wget

RUN mkdir /terraria
RUN mkdir /terraria/world
WORKDIR /terraria

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip
RUN unzip terraria-server-$TERRARIA_VERSION.zip
RUN rm terraria-server-$TERRARIA_VERSION.zip

RUN chmod +x /terraria/$TERRARIA_VERSION/Linux/TerrariaServer.bin.x86_64

# Server Configs
COPY ./configs/vanila_server_config.txt /terraria/vanila_server_config.txt

# RUN Server
WORKDIR /terraria/$TERRARIA_VERSION/Linux
# ENTRYPOINT ["./TerrariaServer.bin.x86_64","-config","/terraria/vanila_server_config.txt"]
