# API with Express + Typescript

## Selecting the Node.js version

At the moment this API was built, the LTS version of Node.js is [20.11.1](https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md#20.11.1).

So [asdf](https://github.com/asdf-vm/asdf) was used to install this version.

```console
    jeff@jefferson:~/study-area/simple-api$ asdf install nodejs 20.11.1
    jeff@jefferson:~/study-area/simple-api$ asdf local nodejs 20.11.1
    jeff@jefferson:~/study-area/simple-api$ node -v
    v20.11.1
    jeff@jefferson:~/study-area/simple-api$ npm -v
    10.2.4
```

Using **eslint**, **prettier** and **editorconfig** to help me standardize my code style.

To build the container image just use the command:

```console
    docker build . -t simple-api:v0.0.1
```

To run the application locally, you can use:

```console
    docker run -it --name simple-api -p 3000:3000 simple-api:v0.0.1
```

Or just:

```console
    docker compose up
```
