#!/bin/bash

# 后台启动Halo
java \
-Xms128m \
-Xmx256m \
-jar halo.jar \
--server.port=8090 \
--halo.external-url=https://www.langzi91.us.ci \
--server.forward-headers-strategy=native \
--spring.profiles.active=prod &

# 等待Halo启动
sleep 20

# 启动隧道，替换成你自己的隧道token
./cloudflared tunnel run --token 这里粘贴你的Zero Trust隧道token
