# kool-dev/docker-node

<p align="center">
<a href="https://github.com/kool-dev/docker-node/actions"><img src="https://github.com/kool-dev/docker-node/workflows/CI/badge.svg" alt="Github Actions Build Status"></a>
</p>

Minimal Node Docker image focused on Laravel applications. Its use is intended for [fwd](https://github.com/kool-dev/fwd), but can fit in any other Node use-case.

## Usage

With `docker run`:

```sh
docker run -it --rm kooldev/node:alpine node -v
```

### Available Tags

- **10**: Node 10
- **10-qa**: Node 10 with QA Utilities: `buddy.js jshint jsinspect eslint`
- **10-andois**: Node 10 with Adonis
- **10-andois-qa**: Node 10 with Adonis and QA Utilities: `buddy.js jshint jsinspect eslint`
- **10-nest**: Node 10 with Nest
- **10-nest-qa**: Node 10 with Nest and QA Utilities: `buddy.js jshint jsinspect eslint`
- **12**: Node 12
- **12-qa**: Node 12 with QA Utilities: `buddy.js jshint jsinspect eslint`
- **12-andois**: Node 12 with Adonis
- **12-andois-qa**: Node 12 with Adonis and QA Utilities: `buddy.js jshint jsinspect eslint`
- **12-nest**: Node 12 with Nest
- **12-nest-qa**: Node 12 with Nest and QA Utilities: `buddy.js jshint jsinspect eslint`
- **14**: Node 14
- **14-qa**: Node 14 with QA Utilities: `buddy.js jshint jsinspect eslint`
- **14-andois**: Node 14 with Adonis
- **14-andois-qa**: Node 14 with Adonis and QA Utilities: `buddy.js jshint jsinspect eslint`
- **14-nest**: Node 14 with Nest
- **14-nest-qa**: Node 14 with Nest and QA Utilities: `buddy.js jshint jsinspect eslint`
- **latest**: Node 14
- **qa**: Node 14 with QA Utilities: `buddy.js jshint jsinspect eslint`
- **andois**: Node 14 with Adonis
- **andois-qa**: Node 14 with Adonis and QA Utilities: `buddy.js jshint jsinspect eslint`
- **nest**: Node 14 with Nest
- **nest-qa**: Node 14 with Nest and QA Utilities: `buddy.js jshint jsinspect eslint`


### Variables

**ASUSER**: Changes the user id that executes the commands

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
