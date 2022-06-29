FROM node:latest

RUN npm i @tuyapi/cli -g

ENTRYPOINT ["/usr/local/bin/tuya-cli"]
