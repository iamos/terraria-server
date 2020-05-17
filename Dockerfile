FROM ubuntu:18.04
# iamos

# Set ENV
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG TERRARIA_VERSION=1402
ARG SERVER_CONF

# Install packages
RUN apt-get update
RUN apt-get install -y zip wget

# Tshock download
RUN mkdir /terraria
RUN mkdir /terraria/world
WORKDIR /terraria

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-$TERRARIA_VERSION.zip
RUN unzip terraria-server-$TERRARIA_VERSION.zip
RUN rm terraria-server-$TERRARIA_VERSION.zip
RUN chmod +x /terraria/$TERRARIA_VERSION/Linux/TerrariaServer.bin.x86_64

# Tshock Settings
COPY ./serverconfig.txt /terraria

# RUN Server
WORKDIR /terraria/$TERRARIA_VERSION/Linux
ENTRYPOINT ["./TerrariaServer.bin.x86_64","-config","/terraria/serverconfig.txt"]
