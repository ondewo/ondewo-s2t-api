<p align="center">
    <a href="https://www.ondewo.com">
      <img alt="ONDEWO Logo" src="https://raw.githubusercontent.com/ondewo/ondewo-logos/master/github/ondewo_logo_github_2.png"/>
    </a>
</p>

# ONDEWO S2T APIs

This repository contains the original interface definitions of public ONDEWO APIs that support gRPC protocols. Reading the original interface definitions can provide a better understanding of ONDEWO APIs and help you to utilize them more efficiently. You can also use these definitions with open source tools to generate client libraries, documentation, and other artifacts.

The API documentation is generated from `ondewo/s2t/speech-to-text.proto` by
[protoc-gen-doc](https://github.com/pseudomuto/protoc-gen-doc) in two formats:

* [html](https://ondewo.github.io/ondewo-s2t-api)
* [markdown](docs/index.md)

The core components of all the client libraries are built directly from files in this repo using [the proto compiler.](https://github.com/ondewo/ondewo-proto-compiler)

For an end-user, the APIs in this repo function mostly as documentation for the endpoints. For specific implementations, look in the following repos for working implementations:

* [Python](https://github.com/ondewo/ondewo-s2t-client-python)
* [Angular](https://github.com/ondewo/ondewo-s2t-client-angular)
* [JavaScript](https://github.com/ondewo/ondewo-s2t-client-js)
* [TypeScript](https://github.com/ondewo/ondewo-s2t-client-typescript)
* [NodeJS](https://github.com/ondewo/ondewo-s2t-client-nodejs)

Please note that some of these implementations are works-in-progress. The repo will make clear the status of the implementation.

## Overview

ONDEWO APIs use [Protocol Buffers](https://github.com/google/protobuf) version 3 (proto3) as their Interface Definition Language (IDL) to define the API interface and the structure of the payload messages. The same interface definition is used for gRPC versions of the API in all languages.

There are several ways of accessing APIs:

1. Protocol Buffers over gRPC: You can access APIs published in this repository through [GRPC](https://github.com/grpc), which is a high-performance binary RPC protocol over HTTP/2. It offers many useful features, including request/response multiplex and full-duplex streaming.

2. ONDEWO Client Libraries:
You can use these libraries to access ONDEWO Cloud APIs. They are based on gRPC for better performance and provide idiomatic client surface for better developer experience.

## Discussions

Please use the issue tracker in this repo for discussions about this API, or the issue tracker in the relevant client if it is language-specific.

## Repository Structure

```bash
.
├── CLAUDE.md
├── CONTRIBUTING.md
├── Dockerfile.utils
├── docs                                  # generated + deployed by CI, never edited by hand
│   ├── index.html
│   ├── index.md
│   └── style.css
├── .github
│   └── workflows
│       └── generate-doc-and-deploy.yaml
├── .gitignore
├── install_nvm.sh
├── LICENSE
├── Makefile
├── .markdownlint-cli2.yaml
├── ondewo
│   └── s2t
│       └── speech-to-text.proto          # the single source of truth
├── .pre-commit-config.yaml
├── README.md
└── RELEASE.md
```

## Generate gRPC Source Code

API client libraries can be built directly from files in this repo using [the proto compiler.](https://github.com/ondewo/ondewo-proto-compiler)

## Automatic Release Process

The entire process is automated to make development easier. The actual steps are simple:

TODOs after Pull Request was merged in:

* Checkout master:
    >git checkout master
* Pull the new stuff:
    >git pull
* (If not already, run the `setup_developer_environment_locally` command):
   >make setup_developer_environment_locally
* Update the `ONDEWO_S2T_API_VERSION` in the `Makefile`
* Add the new Release Notes in `RELEASE.md` in the format:

   ```
   ## Release ONDEWO S2T API X.X.X       <---- Beginning of Notes

      ...<NOTES>...

   *****************                      <---- End of Notes
   ```

* `Commit and push` the changes made in `RELEASE.md` and `Makefile`
* Release:
   >make ondewo_release

---
The `make ondewo_release` command can be divided into 5 steps:

* cloning the devops-accounts repository and extracting the credentials
* creating and pushing the release branch
* creating and pushing the release tag
* creating the GitHub release

The variable for the GitHub Access Token is inside the Makefile, but the value is overwritten during
`make ondewo_release`, because it is passed from the devops-accounts repo as an argument to the actual `release` command.

## Automatic Release Process - Clients

Every available Client of this API can be released from this repository, to make the release process for major and minor changes easier.

The generic `release_client` command depends on these variables:

* `ONDEWO_S2T_API_VERSION` -- Current API version
* `GENERIC_CLIENT` -- specifies `SSH git link` to client-repository
* `RELEASEMD` -- position of `RELEASE.md` inside the client-repository
* `GENERIC_RELEASE_NOTES` -- template text of client release notes
* `GENERIC_RELEASE_SECTION` -- heading the generated notes are filed under (default `Improvements`)
* `GENERIC_RELEASE_EXTRA` -- optional extra bullet appended to the generated notes

`make release_all_clients` releases all five clients **in parallel**; one failing client does not
abort the others, and the run ends with a per-client `RELEASED` / `SKIP` / `FAILED` summary.

On a major (breaking) API bump, override the section so the clients are not published under
"Improvements":

```bash
make release_all_clients GENERIC_RELEASE_SECTION='Breaking Changes' \
  GENERIC_RELEASE_EXTRA='* `S2TGetServiceInfoResponse` is renamed to `S2tGetServiceInfoResponse`.\n'
```

`release_client` will not insert the generated notes into a client whose `RELEASE.md` already
documents this version -- a hand-curated client entry is kept as it is.

## Proto Documentation

The documentation for this, and all other APIs and their available versions, can be found on [ondewo.github.io](https://ondewo.github.io). For Offline usage, it can also be found in the `docs` folder.

`make update_githubio` publishes the generated docs to the `ondewo.github.io` repository. It is a
manual target -- no pre-commit hook runs it. It will preemptively stop if:

* The command is not run on the `master` branch
* There already exists a version-object with the specified version in the `data.js` of the `ondewo.github.io` repository

> :warning:  This command is dependent on your installation of NPM and NodeJS -- Make sure to install both, or run `make setup_developer_environment_locally`

The `docs/` folder is regenerated and committed back to `master` by the `Generate Documentation`
GitHub Actions workflow on every push. Never edit it by hand -- change
`ondewo/s2t/speech-to-text.proto` and let CI regenerate, or run `make build_docs` locally and
commit the result in the same commit as the `.proto` change.
