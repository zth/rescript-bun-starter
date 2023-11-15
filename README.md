# rescript-bun-starter

A starter for getting up and running quickly with ReScript and Bun.

## Getting started

Run installation:

```bash
npm i
```

This uses `npm` to install packages, but you can use `bun install` as well if you'd like.

All dev-time scripts can be run at the same time via:

```bash
bun run dev
```

> Check out `package.json` and change scripts as you see fit.

This starts the ReScript compiler, the default little web server that comes with this repo, and also runs the tests from `tests/`.

The web server is automatically reloaded when you make changes, and you can access it on http://localhost:7777/add?a=10&b=20 to see it in action. The code is in `src/Main.res`
