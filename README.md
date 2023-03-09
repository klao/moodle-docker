# Simple Moodle setup with Docker Compose

Trying to be minimalistic and only depend on standard images (except for DB admin).

## Use

Starting:

```sh
mkdir -p moodle moodledata
docker-compose up -d
```

You can download and unpack Moodle into the `moodle` directory and then do installation on the web.
Or you can use my install script:

```sh
docker exec -it demoodle-web-1 install-moodle.sh
```
