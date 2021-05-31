FROM iamos/terraria-base:latest

RUN wget https://api.github.com/repos/tModLoader/tModLoader/releases/latest -O tMLlatest.json &&\
    tml=`sed -n 's/.*\(https.*Linux.*.tar.gz*\)".*/\1/p' tMLlatest.json` &&\
    wget $tml &&\
    tar xzf tModLoader.Linux*.tar.gz &&\
    chmod a+x tModLoader tModLoader-* tModLoaderServer *.bin* && \
    rm *.tar.gz tMLlatest.json

# tModServer Settings
COPY ./configs/tmodconfig.txt /terraria/tmodconfig.txt

# RUN Server
ENTRYPOINT ["./tModLoaderServer.bin.x86_64","-config","/terraria/tmodconfig.txt"]