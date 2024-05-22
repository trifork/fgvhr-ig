# Implementation Guide

To run locally, run the following two commands:

```bash
# This takes quite some time on the first run. Please bear with it.
docker build --rm --file Dockerfile -t fgvh-ig:local .

docker run -it --rm --name fgvh-ig -p 5070:8080 fgvh-ig:local
```