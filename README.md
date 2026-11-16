[![CI/CD](https://github.com/kool-dev/docker-node/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/kool-dev/docker-node/actions/workflows/ci-cd.yml)

## Description

Minimal [Node](https://nodejs.org/en/) Docker image. It's use is intended for [kool.dev](https://github.com/kool-dev/kool), but can fit in any other Node use-case.

## Available Tags

### 22

- [22](https://github.com/kool-dev/docker-node/blob/master/22/Dockerfile)

### 24

- [24](https://github.com/kool-dev/docker-node/blob/master/24/Dockerfile)

### 24-nginx

- [24-nginx](https://github.com/kool-dev/docker-node/blob/master/24-nginx/Dockerfile)

### 26

- [26](https://github.com/kool-dev/docker-node/blob/master/26/Dockerfile)

### Legacy tags

The following images have been discontinued, but still exist on Hub Docker in case you need them. We strongly advise moving to the newer versions.

- [10](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10/Dockerfile), [10-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10-qa/Dockerfile), [10-adonis](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10-adonis/Dockerfile), [10-adonis-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10-adonis-qa/Dockerfile), [10-nest](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10-nest/Dockerfile), [10-nest-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/10-nest-qa/Dockerfile)
- [12](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12/Dockerfile), [12-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12-qa/Dockerfile), [12-adonis](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12-adonis/Dockerfile), [12-adonis-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12-adonis-qa/Dockerfile), [12-nest](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12-nest/Dockerfile), [12-nest-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/12-nest-qa/Dockerfile)
- [14](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14/Dockerfile), [14-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14-qa/Dockerfile), [14-adonis](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14-adonis/Dockerfile), [14-adonis-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14-adonis-qa/Dockerfile), [14-nest](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14-nest/Dockerfile), [14-nest-qa](https://github.com/kool-dev/docker-node/tree/legacy-2022-07/14-nest-qa/Dockerfile)
- [16](https://github.com/kool-dev/docker-node/blob/master/16/Dockerfile)
- [18](https://github.com/kool-dev/docker-node/blob/master/18/Dockerfile)
- [20](https://github.com/kool-dev/docker-node/blob/37fa7fd/20/Dockerfile)
- [21](https://github.com/kool-dev/docker-node/blob/master/21/Dockerfile)
- [22-nginx](https://github.com/kool-dev/docker-node/blob/master/22-nginx/Dockerfile)

## Environment Variables

Variable | Default Value | Description
--- | --- | ---
**ASUSER** | `0` | Changes the user id that executes the commands
**UID** | `0` | Changes the user id that executes the commands **(ignored if ASUSER is provided)**

## Usage

With `docker run`:

```sh
docker run -it --rm kooldev/node:22 node -v
```

With environment variables:

```sh
docker run -it --rm -e ASUSER=500 kooldev/node:22 node -v
```

With `docker-compose.yml`:

```yaml
app:
  image: kooldev/node:22
  environment:
    ASUSER: "${$UID}"
```

## Contributing

### Package manager defaults

pnpm's per-user `~/.config/pnpm/config.yaml` sets `storeDir` to
`~/.pnpm-store` and `packageImportMethod` to `copy`. npm no longer receives
pnpm-only or removed `scripts-prepend-node-path` options in `.npmrc`.
With current pnpm, hoisting policy belongs in the project's
`pnpm-workspace.yaml`; set `shamefullyHoist: true` there if required.

Run `docker run --rm -v "$PWD:/app" fireworkweb/fwd:v1.0 fwd template`,
`git diff --exit-code`, and `bash tests/architecture.sh` to check
generated contexts and download selection with the real template engine. After building an image, run
`sh tests/image.sh IMAGE` to exercise dockerize, npm, yarn, pnpm, config
resolution and ownership as root and two remapped user IDs.

### Shared native publication

CI uses [shared Bash/`jq` actions](https://github.com/kool-dev/action/blob/master/image-ci.md),
pinned in the workflow. Native amd64/arm64 jobs build/test once. Node 24
NGINX inherits this job's tested Node parent, verified by ID and layer ancestry.
The old per-run local Buildx cache export is replaced by the common Docker
driver so derived images resolve fresh local parents consistently.

Only trusted `master` releases stage tested IDs under run/attempt-scoped tags.
One publisher validates all four stable tags × both architectures before stable
updates. Historical `-x86_64`/`-aarch64` tags remain compatibility aliases, but
are updated only after the full native matrix succeeds. PRs/forks/feature branches
cannot log in or publish. Release runs serialize; only PR runs are canceled.
On failure, rerun **all jobs**: no previous-attempt metadata is reused and there
is no resume workflow. Stable updates are not atomic across tags.

### Updating images and building locally

> You must have [`kool`](https://github.com/kool-dev/kool) installed.

This repo leverages a simple templating tool based on Laravel Blade to generate the actual building contexts for each image flavour.

You should change `fwd-template.json` and `template` folder.

After your changes, just run `kool run template` to compile the template and generate all version folder/files.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
