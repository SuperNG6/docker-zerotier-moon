# docker-zerotier

仅自用  
https://hub.docker.com/r/superng6/zerotier

# MOON 公网服务端
```yaml
version: "3.1"
services:
  zerotier:
    image: zerotier:moon-latest
    container_name: zerotier-moom
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_ADMIN
    network_mode: host
    volumes:
      - /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro
      - $PWD/config:/var/lib/zerotier-one
    devices:
      - /dev/net/tun:/dev/net/tun
    command: -4 服务器IP -p 端口
```


```
docker run \
  -d \
  --restart unless-stopped \
  --name zerotier-moom \
  --device /dev/net/tun \
  --net host \
  --cap-add NET_ADMIN \
  --cap-add SYS_ADMIN \
  -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro \
  -v $PWD/config:/var/lib/zerotier-one \
  superng6/zerotier:moon \
  -4 1.2.3.4
```

# 组网端

```yaml
version: "3.1"
services:
  zerotier:
    image: superng6/zerotier
    container_name: zerotier
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_ADMIN
    network_mode: host
    volumes:
      - /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro
      - $PWD/config:/var/lib/zerotier-one
    devices:
      - /dev/net/tun:/dev/net/tun
```

```
docker run \
  -d \
  --restart unless-stopped \
  --name zerotier \
  --device /dev/net/tun \
  --net host \
  --cap-add NET_ADMIN \
  --cap-add SYS_ADMIN \
  -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro \
  -v $PWD/config:/var/lib/zerotier-one \
  superng6/zerotier
```

## 进入容器连接MOON
docker exec -i zerotier zerotier-cli join *
docker exec -i zerotier zerotier-cli orbit * *
