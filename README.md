![CI/CD](https://github.com/kool-dev/docker-node/workflows/CI/CD/badge.svg)

## Description

Minimal [Node](https://nodejs.org/en/) Docker image. It's use is intended for [kool.dev](https://github.com/kool-dev/kool), but can fit in any other Node use-case.

## Available Tags

### 16

- [16](https://github.com/kool-dev/docker-node/blob/master/16/Dockerfile)

### 18

- [18](https://github.com/kool-dev/docker-node/blob/master/18/Dockerfile)

### Legacy / discontinued tags

- [10](https://github.com/kool-dev/docker-node/blob/master/10/Dockerfile), [10-qa](https://github.com/kool-dev/docker-node/blob/master/10-qa/Dockerfile), [10-adonis](https://github.com/kool-dev/docker-node/blob/master/10-adonis/Dockerfile), [10-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/10-adonis-qa/Dockerfile), [10-nest](https://github.com/kool-dev/docker-node/blob/master/10-nest/Dockerfile), [10-nest-qa](https://github.com/kool-dev/docker-node/blob/master/10-nest-qa/Dockerfile)
- [12](https://github.com/kool-dev/docker-node/blob/master/12/Dockerfile), [12-qa](https://github.com/kool-dev/docker-node/blob/master/12-qa/Dockerfile), [12-adonis](https://github.com/kool-dev/docker-node/blob/master/12-adonis/Dockerfile), [12-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/12-adonis-qa/Dockerfile), [12-nest](https://github.com/kool-dev/docker-node/blob/master/12-nest/Dockerfile), [12-nest-qa](https://github.com/kool-dev/docker-node/blob/master/12-nest-qa/Dockerfile)
- [14](https://github.com/kool-dev/docker-node/blob/master/14/Dockerfile), [14-qa](https://github.com/kool-dev/docker-node/blob/master/14-qa/Dockerfile), [14-adonis](https://github.com/kool-dev/docker-node/blob/master/14-adonis/Dockerfile), [14-adonis-qa](https://github.com/kool-dev/docker-node/blob/master/14-adonis-qa/Dockerfile), [14-nest](https://github.com/kool-dev/docker-node/blob/master/14-nest/Dockerfile), [14-nest-qa](https://github.com/kool-dev/docker-node/blob/master/14-nest-qa/Dockerfile)

## Environment Variables

Variable | Default Value | Description
--- | --- | ---
**ASUSER** | `0` | Changes the user id that executes the commands
**UID** | `0` | Changes the user id that executes the commands **(ignored if ASUSER is provided)**

## Usage

With `docker run`:

```sh
docker run -it --rm kooldev/node:16 node -v
```

With environment variables:

```sh
docker run -it --rm -e ASUSER=500 kooldev/node:16 node -v
```

With `docker-compose.yml`:

```yaml
app:
  image: kooldev/node:14
  environment:
    ASUSER: "${$UID}"
```

## Contributing

### Updating images and building locally

> You must have [`kool`](https://github.com/kool-dev/kool) installed.

This repo leverages a simple templating tool based on Laravel Blade to generate the actual building contexts for each image flavour.

You should change `fwd-template.json` and `template` folder.

After your changes, just run `kool run template` to compile the template and generate all version folder/files.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
