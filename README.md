![CI/CD](https://github.com/kool-dev/docker-node/workflows/CI/CD/badge.svg)

## Description

Minimal [Node](https://nodejs.org/en/) Docker image. It's use is intended for [kool.dev](https://github.com/kool-dev/kool), but can fit in any other Node use-case.

## Available Tags

### 10

- [10](https://github.com/kool-dev/docker-node/blob/master/10/Dockerfile)
- [10-qa](https://github.com/kool-dev/docker-node/blob/master/10-qa/Dockerfile)
- [10-adonis](https://github.com/kool-dev/docker-node/blob/master/10-adonis/Dockerfile)
- [10-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/10-adonis-qa/Dockerfile)
- [10-nest](https://github.com/kool-dev/docker-node/blob/master/10-nest/Dockerfile)
- [10-nest-qa](https://github.com/kool-dev/docker-node/blob/master/10-nest-qa/Dockerfile)

### 12

- [12](https://github.com/kool-dev/docker-node/blob/master/12/Dockerfile)
- [12-qa](https://github.com/kool-dev/docker-node/blob/master/12-qa/Dockerfile)
- [12-adonis](https://github.com/kool-dev/docker-node/blob/master/12-adonis/Dockerfile)
- [12-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/12-adonis-qa/Dockerfile)
- [12-nest](https://github.com/kool-dev/docker-node/blob/master/12-nest/Dockerfile)
- [12-nest-qa](https://github.com/kool-dev/docker-node/blob/master/12-nest-qa/Dockerfile)

### 14

- [14](https://github.com/kool-dev/docker-node/blob/master/14/Dockerfile)
- [14-qa](https://github.com/kool-dev/docker-node/blob/master/14-qa/Dockerfile)
- [14-adonis](https://github.com/kool-dev/docker-node/blob/master/14-adonis/Dockerfile)
- [14-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/14-adonis-qa/Dockerfile)
- [14-nest](https://github.com/kool-dev/docker-node/blob/master/14-nest/Dockerfile)
- [14-nest-qa](https://github.com/kool-dev/docker-node/blob/master/14-nest-qa/Dockerfile)

## Environment Variables

Variable | Description | Default Value
--- | --- | ---
**ASUSER** | Changes the user id that executes the commands | `-0`
**UID** | Changes the user id that executes the commands **(ignored if ASUSER is provided)** | `-0`

## Usage

With `docker run`:

```sh
docker run -it --rm kooldev/node:14 node -v
```

With environment variables:

```sh
docker run -it --rm -e ASUSER=500 kooldev/node:14 node -v
```

With `docker-compose.yml`:

```yaml
app:
  image: kooldev/node:14
  environment:
    ASUSER: "${$UID}"
```

## Contributing

### Dependencies

- [fwd](https://github.com/fireworkweb/fwd#fireworkwebfwd)

You should change `fwd-template.json` and `template` folder.

After your changes, just run `fwd template` to compile the template and generate all version folder/files.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
