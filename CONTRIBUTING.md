# How to become a contributor and submit your own code

## Contributor License Agreements

We'd love to accept your sample apps and patches! Before we can take them, we
have to jump a couple of legal hurdles.

Please fill out either the individual or corporate Contributor License Agreement
(CLA).

* If you are an individual writing original source code and you're sure you
    own the intellectual property, then you'll need to sign an [individual CLA](TODO:).
* If you work for a company that wants to allow you to contribute your work,
    then you'll need to sign a [corporate CLA](TODO:).

Follow either of the two links above to access the appropriate CLA and
instructions for how to sign and return it. Once we receive it, we'll be able to
accept your pull requests.

## Contributing A Patch

1. Submit an issue describing your proposed change to the repo in question.
1. The repo owner will respond to your issue promptly.
1. If your proposed change is accepted, and you haven't already done so, sign a
   Contributor License Agreement (see details above).
1. Fork the desired repo, develop and test your code changes.
1. Ensure that your code adheres to the existing style in the sample to which
   you are contributing. Refer to the
   [Google Cloud Platform Samples Style Guide](TODO:) for the
   recommended coding standards for this organization.
1. Ensure that your code has an appropriate set of unit tests which all pass.
1. Submit a pull request.

## Developing In This Repository

This repository holds exactly one hand-written source file, `ondewo/s2t/speech-to-text.proto`.
There is no Python, Node or Java toolchain here and no test suite -- everything else is either
generated (`docs/`) or release automation (`Makefile`).

### Setup

```bash
make setup_developer_environment_locally   # installs the pre-commit hooks and nvm/node
```

The pre-commit hooks must be installed for **both** stages, which is what the target does:

```bash
pre-commit install
pre-commit install --hook-type commit-msg
```

### Branch And Commit Naming

Branches carry the JIRA ticket: `feature|bugfix|support|hotfix/OND231-624-short-description`.

Write the commit subject as plain [Conventional Commits](https://www.conventionalcommits.org/)
(`feat: ...`, `fix(release): ...`, `docs: ...`). **Never prepend the ticket id yourself** -- the
`giticket` hook reads it from the branch name and prepends `[OND231-624]` (with a trailing space)
for you. Writing it by hand produces `[OND231-624] [OND231-624] feat: ...`.

The hook order in `.pre-commit-config.yaml` matters and must not be swapped:
`conventional-pre-commit` validates the subject the author wrote, and only then does `giticket`
decorate it. Reversed, giticket rewrites the message into something conventional-pre-commit cannot
parse and every ticket-branch commit is rejected.

### Changing The API

* Edit `ondewo/s2t/speech-to-text.proto`.
* Regenerate the documentation and commit `docs/` **in the same commit**:

  ```bash
  make build_docs && make clean_docs_builder
  ```

  If you skip this, the `Generate Documentation` workflow regenerates `docs/` on push and commits
  it back to `master` itself, which is why `docs/` must never be hand-edited.
* Add a `RELEASE.md` entry under a new `## Release ONDEWO S2T API X.Y.Z` heading, terminated by a
  `*****************` separator. Both are parsed by the release tooling -- the heading by
  `CURRENT_RELEASE_NOTES`, the separator as the end of the entry.
* Bump `ONDEWO_S2T_API_VERSION` in the `Makefile` to match.

### Do Not Add A `google/api/*` Import

`ondewo/s2t/speech-to-text.proto` may only import protoc's bundled well-known types
(`google/protobuf/*`). The documentation action runs `protoc -I. -Igoogleapis` but no `googleapis`
checkout ever reaches the workspace, so a `google/api/annotations.proto` import fails the CI job
with `File not found.` and publishes no documentation at all.
