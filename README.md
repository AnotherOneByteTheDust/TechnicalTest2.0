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
