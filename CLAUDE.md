# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A **proto-only API repository**. Exactly one hand-written source file:

```text
ondewo/s2t/speech-to-text.proto
```

Everything else is generated output (`docs/`), release automation (`Makefile`), lint configuration or
documentation. There is **no executable code of any kind** — `git ls-files '*.py' '*.ts' '*.js'` is empty, and
`git log --all --diff-filter=A -- '*.py'` shows no `.py` file was ever added. There is no `pyproject.toml`, no
`package.json`, no `uv.lock`, no `Jenkinsfile`.

Consequences that hold for every task here:

- **There are no tests and no coverage gate, and none can be invented.** "100% coverage" is not applicable —
  there is no executable surface to cover. The gate that actually protects this repo is the `Generate
  Documentation` workflow (below); treat it as this repo's CI.
- **There is no `ondewo-proto-compiler` submodule** (`.gitmodules` does not exist). Nothing in this repo pins a
  compiler version, so there is no pin to bump here — see "Proto compiler" below for where the version really
  comes from.
- Python conventions (loguru logging, Google-style docstrings, ruff/mypy/uv) do **not** apply here. They belong
  to the client repos.

## Working Principles

Behavioral guidelines to reduce common mistakes. They bias toward caution over speed; for trivial tasks, use
judgment.

### Think before coding

Don't assume. Don't hide confusion. Surface tradeoffs.

Before implementing:

- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### Simplicity first

Minimum code that solves the problem. Nothing speculative.

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### Surgical changes

Touch only what you must. Clean up only your own mess.

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:

- Remove imports/variables/functions that _your_ changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: every changed line should trace directly to the user's request.

### Goal-driven execution

Define success criteria. Loop until verified. For multi-step tasks, state a brief plan with a verification
step per item. Strong success criteria let you loop independently; weak ones ("make it work") require constant
clarification.

## Verifying A Change

There is no test runner. The full local verification for this repo is three commands:

```bash
uvx pre-commit run --all-files                 # must exit 0
make -n setup_developer_environment_locally    # must parse (catches Makefile breakage)
make build_docs && make clean_docs_builder     # must exit 0 and leave docs/ unchanged
```

`pre-commit` is **not** on `PATH` on this machine — always invoke it as `uvx pre-commit …` (`uv` lives at
`~/.local/bin/uv`). `make precommit_hooks_run_all_files` calls a bare `pre-commit` and will fail for that
reason alone; that is a machine-setup detail, not a repo defect.

Git hooks are **not** installed in this working copy (`.git/hooks/` holds only `.sample` files and
`core.hooksPath` is unset), so commits here do not run pre-commit. Run the hooks explicitly, or install them
with `pre-commit install && pre-commit install --hook-type commit-msg`.

## Pre-commit

Language-agnostic hooks only — **markdownlint-cli2, pre-commit-hooks hygiene, conventional-pre-commit,
giticket**. No ruff/mypy/uv, because there is no Python. Generated docs (`docs/`) and generated code are
excluded via the top-level `exclude:`.

### Hook order is load-bearing: conventional-pre-commit BEFORE giticket

`conventional-pre-commit` validates the subject the author wrote; `giticket` then prepends `[<TICKET>]`.
giticket has no ticket-prefix option in conventional-pre-commit, so **with the order reversed every commit on
a branch matching giticket's regex is rejected** — giticket rewrites the message and the next hook fails it
for the rewrite. This repo shipped the wrong order until it was fixed; it went unnoticed only because recent
work happened on `master`, where giticket's regex does not match.

Measured on a throwaway repo on branch `feature/OND231-624-hook-order-probe`, hooks installed for real,
committing `feat: a valid conventional subject`:

| order | `git commit` exit | result |
| --- | --- | --- |
| giticket first (old) | 1 | `Conventional Commit … Failed`, no commit created |
| conventional first (current) | 0 | subject becomes `[OND231-624] feat: a valid conventional subject` |

A non-conventional subject is still rejected under the current order, so the validation was not weakened.
**Never reorder these two.**

### Hook versions

Resolved against the upstream tag lists; all four are at the newest stable tag:

| hook | rev | note |
| --- | --- | --- |
| DavidAnson/markdownlint-cli2 | `v0.23.2` | bumped from v0.23.0; 0.23.0 ships markdownlint 0.41.0 whose `applyFix` can crash with `TypeError: Cannot read properties of undefined (reading 'slice')` |
| pre-commit/pre-commit-hooks | `v6.0.0` | already newest |
| compilerla/conventional-pre-commit | `v4.4.0` | already newest **stable** — anything sorting higher is a `-pre1` pre-release of an already-released version; reject those |
| milin/giticket | `'1.92'` | already newest. Keep it **quoted**: unquoted `1.92` is a YAML float and pre-commit would look for the wrong tag. `1.92`, `v1.92` and `master` are all commit `29a1ece` |

`giticket` and `conventional-pre-commit` are `commit-msg`-stage hooks, so they never appear in a
`pre-commit run --all-files` run. Exercise them with
`uvx pre-commit run --hook-stage commit-msg --commit-msg-filename <file>`, or with a real commit on a ticket
branch.

### markdownlint

`MD053` (unused-link-reference-definitions) **must stay disabled** in `.markdownlint-cli2.yaml` — its auto-fix
deletes `[comment]: <>` reference-definition markers that the fleet's release tooling greps for. `docs/` is
excluded twice on purpose (pre-commit `exclude:` and `ignores: docs/**`): `docs/index.md` is regenerated
byte-for-byte by CI, so an auto-fix applied to it is reverted on the next push — a churn loop between the
linter and CI.

markdownlint's `fix: true` also rewrites your own edits. Two it applied while this file's siblings were
written: it strips a trailing space **inside** a code span (`` `[X] ` `` → `` `[X]` ``), so never rely on one
to make a point; and a first `--all-files` run after an edit reports `Failed` simply because it modified
files — re-run and it goes green.

## Release Tooling (`Makefile`)

`ONDEWO_S2T_API_VERSION` (line ~20) is the single version source. `RELEASE.md` must carry a matching
`## Release ONDEWO S2T API <VERSION>` heading terminated by a `*****************` separator; both are parsed.

Invariants that were fixed here and must not regress:

- **`CURRENT_RELEASE_NOTES` terminates on `/^\*{5}/`, not `/\*\*/`.** The old pattern matched the first inline
  markdown `**bold**` span inside the entry and silently truncated the GitHub release body there, with no
  error from `gh release create -n "$(CURRENT_RELEASE_NOTES)"`. Measured on a scratch copy of `RELEASE.md`
  with one bold bullet added to the 7.5.0 entry: old pattern 5 lines, new pattern 26. No committed entry uses
  inline bold yet, which is the only reason it never fired. Verify with `make TEST`.
- **`release_client` guards the RELEASE.md insert.** It inserts the generated boilerplate only when
  `grep -qE "^#+ Release ONDEWO S2T ${UPPER_REPO_NAME} Client ${ONDEWO_S2T_API_VERSION}$"` misses. Without the
  guard, a client whose entry was curated by hand gets a second identical heading, which buries the curated
  entry (the notes slice takes the first match) and trips markdownlint MD025/MD024 in the client's own
  pre-commit, aborting the release.
- **`GENERIC_RELEASE_SECTION` / `GENERIC_RELEASE_EXTRA` drive the generated heading.** Default `Improvements`;
  on a breaking bump run
  `make release_all_clients GENERIC_RELEASE_SECTION='Breaking Changes' GENERIC_RELEASE_EXTRA='* …\n'` so five
  client majors are not published under "Improvements".
- **`GENERIC_RELEASE_NOTES` is emitted markdownlint-clean, via `printf '%b'` reading the environment.** Three
  things are load-bearing and must not regress. It is **one line, and no separator is padded with a space
  before or after it**: the old form wrote each separator as space-backslash-n-space, which left a trailing
  space on every generated line and indented the list item, so the first pre-commit run of every client
  release reported `Failed - files were modified by this hook` (11 auto-fixes in the Python client at 7.5.0).
  It self-healed on the re-run, but the trailing space on the heading also defeated the duplicate-entry guard
  above, whose grep anchors the version on end-of-line — so that guard only ever matched entries a previous
  markdownlint pass had already stripped. It uses **`printf '%b'`, not `echo`**, because `echo` adds a newline
  on top of the trailing `\n` and left a doubled blank line. And it is read as **`"$$GENERIC_RELEASE_NOTES"`
  from the environment** (line 1 is a bare `export`) rather than interpolated into the command text: the value
  used to carry its own double quotes, so a backtick in `GENERIC_RELEASE_EXTRA` was command-substituted —
  which silently gutted the breaking-change example one bullet up into `* is renamed to .`. Verified by
  generating the 7.5.0 Python entry and diffing it byte-for-byte against what the release actually committed.
- **`release_all_clients` fails loudly.** The piped sub-make runs under `bash -c 'set -o pipefail; make -C … |
  tee …'` (a plain `sh` pipe returns `tee`'s 0 and masks failures), and a **marker file**
  (`.already_released_marker-<client>`) distinguishes an "already released" SKIP from a real FAILURE, because
  make flattens recipe exit codes to 2 and the code alone cannot tell them apart.
- **Every token-bearing recipe line is `@`-prefixed** so make never echoes a secret — `docker run -e <TOKEN>`,
  `echo $(TOKEN) | gh auth`, and the credential sub-make `make release $(info)` (which expands the token at
  runtime and is easy to miss).

`make -n release_client GENERIC_CLIENT=… RELEASEMD=…` expands the whole recipe without running anything and is
the fastest way to check a change to it.

There are **no** `install_python_requirements`, `flake8` or `mypy` targets any more. They were removed because
the four URLs `install_python_requirements` wget'd from `ondewo-s2t-client-python/master`
(`requirements.txt`, `requirements-dev.txt`, `.flake8`, `mypy.ini`) all return HTTP 404 since that repo moved
to uv/pyproject.toml — and `wget -q -O <file>` on a 404 writes an empty file and exits non-zero, which took
`setup_developer_environment_locally` down with it. If you ever re-add such a target, drop or add the
prerequisite in the **same** edit: a missing target in a prerequisite list is a make _parse_ failure, not a
recipe failure, and takes every other target with it.

## Git Commits

- **Never include Claude as author or co-author** in commit messages, PR descriptions, or any other text. No
  `Co-Authored-By: Claude…` trailers, no "Generated with Claude Code" footers, no similar attribution. The
  user's configured git identity is the only one that should appear.
- **Never prepend the JIRA ticket ID** (e.g. `[OND231-624]`) to the subject yourself. The `giticket` hook
  reads it from the branch name (`(feature|bugfix|support|hotfix)/<TICKET>-…`) and prepends `[<ticket>]`
  automatically. Writing it by hand produces `[OND231-624] [OND231-624] feat: …`.
- Write plain Conventional Commits (`feat: …`, `fix(release): …`, `docs(claude): …`).

## Proto Compiler

This repo has **no** `ondewo-proto-compiler` submodule and no pinned compiler version — do not go looking for
one to bump. The version is resolved at _release_ time, inside `release_client`:

```make
$(eval PROTO_COMPILER:= $(shell curl https://api.github.com/repos/ondewo/ondewo-proto-compiler/tags \
    | grep "\"name\"" | head -1 | cut -d '"' -f 4))
```

and written into each **client's** Makefile as `ONDEWO_PROTO_COMPILER_GIT_BRANCH=tags/<VERSION>`. Today that
resolves to `5.14.0`, which is also the newest semver tag.

Sharp edge: GitHub's `/tags` endpoint is **not** semver-ordered, so `head -1` means "most recently created
tag", not "highest version". It agrees with the newest semver today; re-tagging an older release would silently
feed the wrong version to every client release. Left as-is deliberately (pre-existing, out of scope), but do
not treat it as a semver lookup.

Note for anyone bumping compiler versions elsewhere: `5.11.0..5.14.0` is entirely Angular/JS/Node/TS **codegen**
fixes (`git diff --stat 5.11.0..5.14.0 -- python/` is empty). Moving a pin changes which image `make build`
would use; it does not rewrite one already-committed stub. Never claim "Regenerated with ondewo-proto-compiler
X" in a RELEASE.md unless stubs were actually regenerated.

## GitHub Actions (`Generate Documentation`) — a required gate, not advisory

`.github/workflows/generate-doc-and-deploy.yaml` is the **only** CI this repository has. It runs on push to
`master`, on pull requests targeting `master`, and on `workflow_dispatch`, and it regenerates and publishes
`docs/`. A red run means the published API documentation stops tracking `ondewo/s2t/speech-to-text.proto`.

The job `generate-doc` (runner `ubuntu-latest`) has exactly three steps:

1. `actions/checkout@v5`
2. `ondewo/ondewo-protoc-gen-doc-action@master` — a **docker** action (`FROM pseudomuto/protoc-gen-doc`) whose
   `entrypoint.sh` runs, for each format in the default `html,md`:
   `protoc -I. -Igoogleapis --doc_opt=/resources/templates/<format>.tmpl,index.<format> --doc_out=docs
   $(find ondewo -name '*.proto' | sort)`, copying `/resources/html/style.css` into `docs/` for the `html` pass.
3. `JamesIves/github-pages-deploy-action@v4` — `branch: master`, `folder: docs`, `target-folder: docs`, guarded
   by `if: ${{ !env.ACT }}`.

**Never run step 3 locally — it pushes a commit to `master`** (the `Deploying to master from @
ondewo/ondewo-s2t-api@<sha> 🚀` commits in `git log`). `if: ${{ !env.ACT }}` exists so a `nektos/act` run skips
it, and there is no other way to exercise it without publishing.

**Reproducing step 2 locally — the exact commands, not an approximation.** Build the action image from its own
`Dockerfile` (that is what `using: docker` does) and run its entrypoint with the action's _default_ inputs
`html,md` and `index`, which the workflow relies on because it passes no `with:` block:

```bash
git clone --depth 1 https://github.com/ondewo/ondewo-protoc-gen-doc-action.git /tmp/gendoc-action
docker build --pull -t local/ondewo-protoc-gen-doc-action:test /tmp/gendoc-action

WS=/tmp/gendoc-ws && rm -rf "$WS" && mkdir -p "$WS"
git archive HEAD | tar -x -C "$WS"          # a clean checkout, so a dirty tree cannot fake a green run
rm -rf "$WS/docs"                            # generate from scratch, not on top of the committed output
docker run --rm -v "$WS":/github/workspace -w /github/workspace --user "$(id -u):$(id -g)" \
  local/ondewo-protoc-gen-doc-action:test html,md index
echo "exit=$?"                               # must be 0 — do NOT pipe the run into `tail`, that eats the code
diff -q docs/index.html "$WS/docs/index.html" && diff -q docs/index.md "$WS/docs/index.md" \
  && diff -q docs/style.css "$WS/docs/style.css"
```

`make build_docs` performs the same clone + build + run, but writes into the working tree instead of a clean
archive, so it cannot catch "the committed `docs/` is stale". Use it to _produce_ docs after a `.proto` change;
use the recipe above to _verify_ CI. `make clean_docs_builder` removes the clone and the local image;
`.tmp-protoc-gen-doc-action/` is gitignored so a forgotten cleanup does not dirty the tree.

Sharp edges, each measured against this repo rather than assumed:

- **`googleapis: warning: directory does not exist.` (printed once per format) is NOT a failure.** The action
  passes `-Igoogleapis` unconditionally and no such directory is checked out here; the run exits 0 anyway,
  because the only imports in `speech-to-text.proto` are `google/protobuf/empty.proto` and
  `google/protobuf/struct.proto`, which are protoc's bundled well-known types. **A `google/api/*` import is the
  one that breaks it**: adding `import "google/api/annotations.proto";` to a proto under `ondewo/` makes the
  step exit 1 with `google/api/annotations.proto: File not found.` and write **no** documentation at all. If
  such an import is ever needed, a `googleapis` checkout has to reach the workspace first — the action does not
  fetch one.
- **Nothing in this pipeline is pinned.** The action is referenced `@master` and its own base image is untagged
  (`FROM pseudomuto/protoc-gen-doc`), so the generated documentation can change with no commit in this
  repository. Rebuild the image with `--pull` when reproducing instead of trusting a cached
  `pseudomuto/protoc-gen-doc:latest` — a stale local image is the one way this check can go green while CI does
  not.
- **The committed `docs/` is in sync with the generator.** Verified at the current HEAD with a `--no-cache
  --pull` image build and a from-scratch generation off `git archive HEAD`: exit 0 and all three files
  byte-identical. Regeneration is currently a no-op. After any `.proto` change, expect CI to commit the
  regenerated documentation back to `master` — that is the deploy working, not someone hand-editing `docs/`.
- **The deploy step carries no event guard**, so a `pull_request` run deploys too. A pull request from a
  **fork** gets a read-only `GITHUB_TOKEN` and step 3 would fail there for a permission reason, not a
  documentation one.

## Other Sharp Edges

- **`gh` (GitHub CLI) is not installed on this machine and there is no API token**, so workflow run status
  cannot be queried. Verify CI by executing its steps locally, as above.
- **`RELEASE.md` is the GitHub release body**, sliced by `CURRENT_RELEASE_NOTES`. Keep entries to API-surface
  changes; tooling and release-automation work is not recorded there (this matches `ondewo-nlu-api`). All 28
  entries currently slice correctly and every separator is exactly 17 `*`.
- **`docs/` must never be hand-edited.** CI regenerates it byte-for-byte and commits it back to `master`.
