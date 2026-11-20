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
* [C++](https://github.com/ondewo/ondewo-s2t-client-cpp)
* [C#](https://github.com/ondewo/ondewo-s2t-client-csharp)
* [Go](https://github.com/ondewo/ondewo-s2t-client-go)
* [Java](https://github.com/ondewo/ondewo-s2t-client-java)
* [PHP](https://github.com/ondewo/ondewo-s2t-client-php)
* [Rust](https://github.com/ondewo/ondewo-s2t-client-rust)

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
The `make ondewo_release` command can be divided into 4 steps:

* cloning the devops-accounts repository into a private temporary directory, reading the GitHub token
  into the environment and deleting the clone (`scripts/with_devops_accounts.sh --github-token`)
* creating and pushing the release branch
* creating and pushing the release tag
* creating the GitHub release

The variable for the GitHub Access Token is inside the Makefile, but the value is overwritten during
`make ondewo_release`, because it is passed from the devops-accounts repo in the environment of the actual
`release` command (never on its command line).

## Automatic Release Process - Clients

All eleven `ondewo-s2t-client-<language>` SDKs (`CLIENTS` in the Makefile: python nodejs typescript
angular js cpp csharp go java php rust) are released from this repository, after the API itself, by one
driver, `scripts/release_client.sh`:

```bash
make preflight_all_clients                  # read-only: every client's preflight, serially
make release_all_clients                    # preflight_all_clients, then all clients in parallel
make preflight_client CLIENT=python         # one client's preflight (likewise preflight_<language>_client)
make release_client CLIENT=python           # one client (likewise release_<language>_client)
```

What `release_all_clients` does:

1. Clones ondewo-devops-accounts **once** into a private `mktemp -d` directory outside every
   repository (`scripts/with_devops_accounts.sh`) and hands each client its own copy as
   `DEVOPS_ACCOUNT_DIR`; every copy and the clone are deleted on every exit path, Ctrl-C included.
2. Runs `preflight_all_clients`. **A single failing preflight stops the run before any client is
   released.**
3. Releases the clients in parallel, each into a fresh `release_run_<language>.log`, and prints a
   `RELEASED` / `SKIP` / `INCOMPLETE` / `FAILED` summary. One failing client does not abort the others;
   the run fails if any client is not `RELEASED` or `SKIP`.

For every client, in preflight and release alike, the driver clones the client, inserts the generated
release notes into its `RELEASE.md` (`src/RELEASE.md` for nodejs, typescript, angular and js) unless it
already documents the version under `## Release ONDEWO S2T <Name> Client <version>` (`<Name>` is the
capitalised language, except `C++` and `PHP`), and rewrites the anchored `ONDEWO_S2T_VERSION=`,
`ONDEWO_PROTO_COMPILER_GIT_BRANCH=tags/<ONDEWO_PROTO_COMPILER_VERSION>` and `(ONDEWO_)S2T_API_GIT_BRANCH=`
assignments of its Makefile. Then the client's Makefile and what origin already has decide.

A **contract** client has the read-only targets `release_preflight` (credentials valid, version new on
origin and registry) and `release_verify` (tag, GitHub release and registry serve the version):

| On the client's origin | Result |
| --- | --- |
| tag `<version>` and `release_verify` passes | **SKIP**: already released and verified |
| tag `<version>` but `release_verify` fails | **INCOMPLETE**: a half-finished release; finish it by hand |
| branch `release/<version>` but no tag | **INCOMPLETE**: a half-finished release; finish or undo it by hand |
| neither | preflight: `release_preflight`; release: `ondewo_release`, then `release_verify` |

A **legacy** client has neither target -- every s2t client today. It is released exactly as before,
through its own `ondewo_release` (which clones the devops accounts itself) followed by `make TEST`, and
the GitHub release `<version>`, which its `ondewo_release` creates last, tells the states apart:

| On the client's origin | Result |
| --- | --- |
| tag or `release/<version>`, GitHub release published (HTTP 200) | **SKIP**: already released |
| tag or `release/<version>`, no GitHub release (HTTP 404) | **INCOMPLETE**: a half-finished release |
| tag or `release/<version>`, any other answer (403/429 rate limit) | **FAILED**: nothing changed, re-run later |
| neither | preflight: the driver's own checks only; release: `ondewo_release`, `TEST`, then the GitHub release must appear |

A client with only one of `release_preflight` / `release_verify` fails with that message. The client
clone is removed on every exit path; files a client container wrote as root are removed through a
digest-pinned busybox container, never `sudo`. The proto compiler is pinned exactly in
`ONDEWO_PROTO_COMPILER_VERSION`; move it deliberately.

The generated notes come from these variables:

* `ONDEWO_S2T_API_VERSION` -- Current API version
* `GENERIC_RELEASE_NOTES` -- template text of client release notes
* `GENERIC_RELEASE_SECTION` -- heading the generated notes are filed under (default `Improvements`)
* `GENERIC_RELEASE_EXTRA` -- optional extra bullet appended to the generated notes

On a major (breaking) API bump, override the section so the clients are not published under
"Improvements":

```bash
make release_all_clients GENERIC_RELEASE_SECTION='Breaking Changes' \
  GENERIC_RELEASE_EXTRA='* `S2TGetServiceInfoResponse` is renamed to `S2tGetServiceInfoResponse`.\n'
```

**Host requirements:** git (with SSH access to GitHub and Bitbucket), make, perl, bash, curl and docker,
plus whatever each client's own release documents. The behaviour above is tested against fake client
repositories by `python3 scripts/test_release_driver.py` (also run by the `Release credential hygiene`
workflow).

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
