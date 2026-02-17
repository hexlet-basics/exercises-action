# exercises-action

[![Github Actions Status](../../workflows/Test%20action/badge.svg)](../../actions)

## Develop

```bash
# setup image
make
# run checks in compose service
make compose
# run CI check flow locally
make ci-check

# run tests directly
make compose-test

# run module checks
make compose-code-lint
# run content/schema checks
make compose-description-lint
make compose-schema-validate

# release
make release
```

## Action contract

Inputs:

- `DOCKER_USERNAME` - username for authentication in `ghcr.io`
- `DOCKER_PASSWORD` - token/password for authentication in `ghcr.io`

Behavior:

- Pull requests: build amd64 image and run `docker compose ... up --abort-on-container-exit`
- Push to `main`: run checks and publish multiarch image (`linux/amd64,linux/arm64`) to GHCR

---

[![Hexlet Ltd. logo](https://raw.githubusercontent.com/Hexlet/assets/master/images/hexlet_logo128.png)](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-action)

This repository is created and maintained by the team and the community of Hexlet, an educational project. [Read more about Hexlet](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-action).

See most active contributors on [hexlet-friends](https://friends.hexlet.io/).
