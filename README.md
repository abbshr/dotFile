# 配置汇总

## macOS

- font
- vscode
- Terminal
- login shell
- ssh key
- sshd
- vip

## ubuntu server in docker

```sh
cd dotFile/
docker build -t xx:dotFile .
docker run --init -d -it --cap-add=ALL --privileged -h myhost --name=ubuntu xx:dotFile

docker exec -it --privileged ubuntu bash
```