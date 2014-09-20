# DockerGen

Create docker containers for local dev and systemd templates for CoreOS deployments. Also some digital ocean stuff.

## First things first

Export your Digital Ocean API key and client key to your env:

export DO_API_KEY=whatever
export DO_CLIENT_KEY=whateverelse

## Generating some systemd love.

Create a cloud-config to init your boxes with. Creates a token for you. Save this, put it in version control.

```
docker_gen:cloud_config
```

Will provision the DO boxes someday.

```
docker_gen:digital_ocean_config
```


Creates a systemd template for postgres and a postgres-discovery entry for having your postgres info in etcd.
```
docker_gen:postgres
```


## Yada
This project rocks and uses MIT-LICENSE.
