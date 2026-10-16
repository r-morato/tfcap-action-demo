# tfcap Action demo

A live test of [tfcap Plan Guard](https://github.com/marketplace/actions/tfcap-plan-guard).

`infra/` uses the module in `modules/network`, pinned to a commit. `infra/tfcap.lock.json` records what that module was reviewed to do: nothing risky.

Open pull requests here show what happens when a module upgrade adds behaviour nobody reviewed. Everything is defused: the only endpoint uses the reserved `.invalid` domain and the script exits before doing anything.
