FROM ubuntu:18.04
# iamos

# Set ENV
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG TERRARIA_VERSION=1353
ARG SERVER_CONF

# Install packages
RUN apt-get update
RUN apt-get install -y zip
RUN apt-get install -y wget

# Tshock download
RUN mkdir /terraria
RUN mkdir /terraria/world
run mkdir /terraria/TMod
WORKDIR /terraria

RUN wget http://terraria.org/server/terraria-server-1353.zip
RUN unzip terraria-server-$TERRARIA_VERSION.zip
RUN rm terraria-server-$TERRARIA_VERSION.zip

WORKDIR /terraria/$TERRARIA_VERSION/Linux

# ADD tModLoader
RUN wget https://github.com/blushiemagic/tModLoader/releases/download/v0.10.1.5/tModLoader.Linux.v0.10.1.5.zip
RUN unzip tModLoader.Linux.v0.10.1.5.zip
RUN rm tModLoader.Linux.v0.10.1.5.zip
RUN chmod +x tModLoaderServer.bin.x86_64

WORKDIR /terraria/TMod

# ADD CalamityMod
RUN wget http://download2329.mediafire.com/n2u3xdcb58mg/ibu3sa3dsv4z6d5/CalamityModV1.4.1.002.zip
RUN unzip CalamityModV1.4.1.002.zip
RUN rm CalamityModV1.4.1.002.zip

# ADD RecipeBrowserMod
RUN wget -O RecipeBrowser.tmod http://javid.ddns.net/tModLoader/download.php?Down=mods/RecipeBrowser.tmod

# tModServer Settings
COPY ./tmodconfig.txt /terraria
COPY ./enabled.json /terraria/TMod


# RUN Server
WORKDIR /terraria/$TERRARIA_VERSION/Linux
ENTRYPOINT ["./tModLoaderServer.bin.x86_64","-config","/terraria/tmodconfig.txt"]
