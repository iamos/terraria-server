docker run -it --restart=unless-stopped \
-p 7777:7777 \
-v /home/iamos/terraria/world:/terraria/world \
--name terraria \
iamos/terraria-vanilla:latest
