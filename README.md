# tfcap Action demo

A live test of [tfcap Plan Guard](https://github.com/marketplace/actions/tfcap-plan-guard).

`infra/` uses the module in `modules/network`, pinned to a commit. `infra/tfcap.lock.json` records what that module was reviewed to do: nothing risky.

Open pull requests here show what happens when a module upgrade adds behaviour nobody reviewed. Everything is defused: the only endpoint uses the reserved `.invalid` domain and the script exits before doing anything.

## The demo pull requests

- [#1 Upgrade network](https://github.com/r-morato/tfcap-action-demo/pull/1): v1.1.0 adds "telemetry" that runs a script during `terraform plan`. tfcap comments, raises a code-scanning alert on the `module` block and fails the check.
- [#2 Network ip ranges](https://github.com/r-morato/tfcap-action-demo/pull/2): v1.2.0 fetches AWS CloudFront IP ranges. The new capabilities were reviewed and approved by adding the `tfcap-approved` label, so tfcap committed the updated lock file to the branch itself.

## How approval works

The workflow has three jobs:

- `tfcap` checks every pull request, every push to `main` and runs daily, so a tag moved behind a pinned version is caught even when nobody opens a PR.
- `approve-prepare` runs when the `tfcap-approved` label is added, and ignores it unless whoever added it has write access. It runs `terraform init` and `tfcap lock` on the PR's code with a read-only token.
- `approve-commit` has write access but never runs the PR's code. It commits only the new `tfcap.lock.json` and marks the check as passed.

See the [tfcap Action docs](https://github.com/r-morato/tfcap/blob/main/docs/github-action.md) for setting this up in your own repository.
