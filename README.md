# Simple tuya-cli container

## Usage

Pre-built docker images are available from [Docker Hub](https://hub.docker.com/repository/docker/omehani/tuya-cli)

    docker run --rm omehani/tuya-cli help

## Local build

Build the container.

    docker build . -t tuya-cli

Then run commands as you would with [tuya-cli].

    docker run --rm \
      tuya-cli set \
      --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 \
      --dps 20  --set true

## Examples

### Reviving Mirabella GENIO globes

As discussed in rospogrigio/localtuya#445 and rospogrigio/localtuya#491, some
versions of the Mirabella GENIO A60 9W LED GLS BK (I002605, mid-2021), at least,
get into a Zombie state when started without Internet access. Reviving them can
be done as follows.

Set some environment variables.

    IP=192.2.0.1
    ID=xxx
    KEY=yyy


Reset the defaults.

    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 20  --set true
    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 21  --set 'white'
    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 22  --set 500
    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 23  --set 1000
    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 25  --set '030e0d00000000000000001f403e8'
    docker run --rm omehani/tuya-cli set --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3 --dps 26  --set 0

Check that everything is in order.

    docker run --rm omehani/tuya-cli get --id ${ID} --key ${KEY} --ip ${IP} --protocol-version 3.3

[tuya-cli]: https://github.com/TuyaAPI/cli
