docker run -it --restart=unless-stopped \
-p 7777:7777 \
-v /home/iamos/terraria/world:/terraria/world \
--name terraria-mod \
iamos/terraria-tmodloader:latest
