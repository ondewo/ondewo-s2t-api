# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Working Principles

Behavioral guidelines to reduce common mistakes. They bias toward caution over speed; for trivial tasks, use judgment.

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

Define success criteria. Loop until verified.

Transform tasks into verifiable goals:

- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:

```text
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

These guidelines are working if: fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and
clarifying questions come before implementation rather than after mistakes.

## Logging

```python
from loguru import logger as log
```

- **Levels:** `log.trace()`, `log.debug()`, `log.info()`, `log.warning()`, `log.error()`, `log.exception()`. Choose by
  hotness/verbosity — `trace` for per-token / hot-path detail, `debug` for routine method entry/exit, `info` for notable
  lifecycle events, `warning` / `error` / `exception` for problems.
- **Interpolate with f-strings, not loguru's `{}` positional args.** Consistent with the Code Style rule, use
  `f"…{value}"`; only add the `f` prefix when the string actually interpolates (`"START: …"` with no params stays a
  plain string).
- **`START:` / `DONE:` bracketing.** Wrap a method (or other notable operation) with a `START:` line at entry and a
  `DONE:` line at exit, both naming `ClassName: method_name` (append `: param={value}` context where useful):

  ```python
  log.debug("START: IntentBertClassifier: predict")
  ...
  log.debug(f"DONE: IntentBertClassifier: predict. Elapsed time: {perf_counter() - start_time:.5f}")
  ```

- **Timing uses `perf_counter()`, rendered `:.5f`.** Measure elapsed time with `time.perf_counter()` captured as a start
  value and subtracted at the `DONE:` line; always format the elapsed value with the `:.5f` spec:

  ```python
  from time import perf_counter

  start_time: float = perf_counter()
  ...
  log.info(f"DONE: SESSION SERVICER: DetectIntent. Elapsed time: {perf_counter() - start_time:.5f}")
  ```

  Never measure a duration with `time.time()` — reserve `time.time()` for wall-clock timestamps (epoch seconds persisted
  to a DB / proto, unique-id or filename stamps). `perf_counter()` has an undefined epoch and must not be stored or
  compared across processes.

## Docstrings

Google-style, triple double-quotes:

```python
"""
Short imperative summary line.

Args:
    param_name (type):
        Description of the parameter.

Returns:
    type:
        Description of the return value.

Raises:
    ExceptionType:
        When this exception is raised.
"""
```

## Git Commits

- **Never include Claude as author or co-author** in commit messages, PR descriptions, or any other text. Do not add
  `Co-Authored-By: Claude…` trailers, "Generated with Claude Code" footers, or any similar attribution.
- The user's own git author identity (already configured in git) is the only identity that should appear on commits.
- This rule overrides the default Claude Code commit-template guidance.
- **Never prepend the JIRA ticket ID** (e.g. `[OND211-2386]`) to the commit subject yourself. The `giticket` pre-commit
  hook reads the ticket from the branch name (`(feature|bugfix|support|hotfix)/<TICKET>-…`) and prepends `[<ticket>]`
  (with a trailing space) automatically. Writing the prefix manually produces a duplicate like
  `[OND211-2386] [OND211-2386] feat: …`. Write the subject as plain Conventional Commits (`feat: …`, `fix(scope): …`,
  `docs(types): …`) and let the hook add the prefix on commit.

## General Principles

- Follow existing patterns before introducing new abstractions.
- Keep changes minimal and consistent with surrounding code.
- Validate inputs early with descriptive, context-rich error messages.
- Use context managers for files, sockets, and thread pools.
- Prefer region comments for grouping methods in files that already use them.
- End edited Markdown and YAML files with a trailing newline.

## Client-release orchestration (`release_all_clients`)

- It **fails loudly** on a genuine client-release error: the piped sub-make runs under `bash -c 'set -o pipefail; make -C … | tee …'` (a plain sh pipe returns tee's 0 and masks failures), and a **marker file** distinguishes an "already released" SKIP from a real FAILURE (make flattens recipe exit codes to 2, so the code alone can't tell them apart). Do not regress either.
- Every token-bearing recipe line is `@`-prefixed so make never echoes a secret — `docker run -e <TOKEN>`, `echo $(TOKEN) | gh auth`, `twine … -p${PYPI_PASSWORD}`, and the credential sub-make `make release $(info)` (which expands the token at runtime and is easy to miss).

## Pre-commit upgraded (language-agnostic hook set)

Pre-commit here uses only the language-agnostic hooks — **markdownlint-cli2, pre-commit-hooks hygiene, giticket, conventional-pre-commit** — no ruff/mypy/uv (there is no Python). Generated docs (`docs/`) and any generated code are excluded via the top-level `exclude:`.

- **markdownlint MD053 is disabled** (its auto-fix deletes `[comment]: <>` reference-definition markers).
- **markdownlint RELEASE.md reformatting is content-safe**: it only strips trailing whitespace and adds blank lines around headings — the `## Release … <VERSION>` headings and `*****` separators that `ondewo_release` greps for remain intact. (Confirmed: the 6.5.0 release notes sliced correctly after the reformat.)

## GitHub Actions (`Generate Documentation`) — a required gate, not advisory

`.github/workflows/generate-doc-and-deploy.yaml` is the **only** CI this repository has (no Jenkinsfile, no
Python toolchain — there is no `pyproject.toml`, no `uv.lock`, so there is no `uv run --frozen …` to mirror
here). It runs on push to `master`, on pull requests targeting `master`, and on `workflow_dispatch`, and it is
what regenerates and publishes `docs/`. Treat a red run as a blocker: a failure means the published API
documentation stops tracking `ondewo/s2t/speech-to-text.proto`.

The job `generate-doc` (runner `ubuntu-latest`) has exactly three steps:

1. `actions/checkout@v5`
2. `ondewo/ondewo-protoc-gen-doc-action@master` — a **docker** action (`FROM pseudomuto/protoc-gen-doc`) whose
   `entrypoint.sh` runs, for each format in the default `html,md`:
   `protoc -I. -Igoogleapis --doc_opt=/resources/templates/<format>.tmpl,index.<format> --doc_out=docs
   $(find ondewo -name '*.proto' | sort)`, copying `/resources/html/style.css` into `docs/` for the `html` pass.
3. `JamesIves/github-pages-deploy-action@v4` — `branch: master`, `folder: docs`, `target-folder: docs`, guarded
   by `if: ${{ !env.ACT }}`.

**Reproducing step 2 locally — the exact commands, not an approximation.** Build the action image from its own
`Dockerfile` (that is what `using: docker` does) and run its entrypoint with the action's _default_ inputs
`html,md` and `index`, which the workflow relies on because it passes no `with:` block:

```bash
git clone --depth 1 https://github.com/ondewo/ondewo-protoc-gen-doc-action.git /tmp/gendoc-action
docker build -t local/ondewo-protoc-gen-doc-action:test /tmp/gendoc-action

WS=/tmp/gendoc-ws && rm -rf "$WS" && mkdir -p "$WS"
git archive HEAD | tar -x -C "$WS"          # a clean checkout, so a dirty tree cannot fake a green run
rm -rf "$WS/docs"                            # generate from scratch, not on top of the committed output
docker run --rm -v "$WS":/github/workspace -w /github/workspace --user "$(id -u):$(id -g)" \
  local/ondewo-protoc-gen-doc-action:test html,md index
echo "exit=$?"                               # must be 0 — do NOT pipe the run into `tail`, that eats the code
diff -q docs/index.html "$WS/docs/index.html" && diff -q docs/index.md "$WS/docs/index.md" \
  && diff -q docs/style.css "$WS/docs/style.css"
```

Step 3 **pushes a commit to `master`** (the `Deploying to master from @ ondewo/ondewo-s2t-api@<sha> 🚀` commits in
`git log`). Never run it locally; `if: ${{ !env.ACT }}` exists so a `nektos/act` run skips it, and there is no
other way to exercise it without publishing.

Sharp edges, each measured against this repo rather than assumed:

- **`googleapis: warning: directory does not exist.` (printed once per format) is NOT a failure.** The action
  passes `-Igoogleapis` unconditionally and no such directory is checked out here; the run exits 0 anyway,
  because the only imports in `speech-to-text.proto` are `google/protobuf/empty.proto` and
  `google/protobuf/struct.proto`, which are protoc's bundled well-known types. **A `google/api/*` import is the
  one that breaks it**: adding `import "google/api/annotations.proto";` to a proto under `ondewo/` makes the step
  exit 1 with `google/api/annotations.proto: File not found.` and write **no** documentation at all. If such an
  import is ever needed, a `googleapis` checkout has to reach the workspace first — the action does not fetch one.
- **Nothing in this pipeline is pinned.** The action is referenced `@master` and its own base image is untagged
  (`FROM pseudomuto/protoc-gen-doc`), so the generated documentation can change with no commit in this
  repository. Rebuild the image when reproducing (`docker build` above) instead of trusting a cached
  `pseudomuto/protoc-gen-doc:latest` — a stale local image is the one way this check can go green while CI does not.
- **`docs/` must stay excluded from markdownlint, and the reason is this workflow.** Both the pre-commit
  `exclude:` (`^docs/`) and `.markdownlint-cli2.yaml`'s `ignores: docs/**` cover it. `docs/index.md` is
  regenerated byte-for-byte on every run, so an auto-fix applied to it is reverted on the next push — a churn loop
  between the linter and CI, not a one-off diff.
- **The committed `docs/` is in sync with the generator** (verified: a from-scratch generation at
  `50b64d97` is byte-identical to all three committed files), so regeneration is currently a no-op. After any
  `.proto` change, expect CI to commit the regenerated documentation back to `master` — that is the deploy
  working, not someone hand-editing `docs/`.
- **The deploy step carries no event guard**, so a `pull_request` run deploys too. The one PR-triggered run in
  this repo's history (run #1) came from a same-repo branch and succeeded; a pull request from a **fork** gets a
  read-only `GITHUB_TOKEN` and step 3 would fail there for a permission reason, not a documentation one.
