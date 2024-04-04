# TechnicalTest

Create docker containers:
    - Two servers show different pages that listens from port 8555
    - One proxy that works as load balancer and listens from port 80.

## Commands

### Start container

```bash
make start env=dev
```

### Start containers (daemon)

```bash
make startd env=dev
```

### Restart containers

```bash
make restart env=dev
```

### Restart containers  (daemon)

```bash
make restartd env=dev
```

### Stop containers

```bash
make stop env=dev
```

### Stop containers, removes them and remove the generated image

```bash
make clean env=dev
```

### Check it works

Start containers and access to [http://localhost/health](http://localhost/health)

## Next steps

- Add new docker compose files with new environments.
- Add .env files. This way, compose files can be dynamically built and golang build can receive environment parameters.
- Add a volume and run golang code from the container. This way, all tools to develop can be inside the docker container and the developer wouldn't need to install anything.
- Add CI/CD. For example, deploy to the different servers (PROD, QA) and golang syntax linter.
- Add husky with prehooks. For example, commit format.
- Add certificates for encrypted conections from internet and between containers.
