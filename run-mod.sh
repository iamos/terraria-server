docker run -it --restart=unless-stopped \
-p 7777:7777 \
-v /home/iamos/terraria/modloader/Worlds:/terraria/world \
-v /home/iamos/terraria/modloader/Mods:/terraria/mods \
--name terraria-mod \
iamos/terraria-tmodloader:latest