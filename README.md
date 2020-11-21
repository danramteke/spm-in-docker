# SPM-in-Docker

An sample project demonstrating how to build Swift Package Manager dependencies separately from a project's code, in order to take advantage of Docker's layer caching.

## Getting started

1. Install [Docker](https://www.docker.com/get-started)
2. Install [Swift](https://www.swift.org/download/)

## Running

Run `swift run` to run the web server outside of Docker. Then visit https://localhost:8080 in your web browser.

## Docker

Run

```
$ docker build -t hello-world .
$ docker run --rm -it -p 8080:8080 -e PORT=8080 hello-world
```

Then visit https://localhost:8080 in your web browser


Now, after editing your main web app, subsequent docker builds will build much quicker, since the dependencies are already downloaded and built.
