FROM iamos/terraria-base:latest

ENTRYPOINT ["./TerrariaServer.bin.x86_64","-config","/terraria/serverconfig.txt"]