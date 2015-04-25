#!/bin/sh
docker build -t rabbit52/boot2docker .
docker run --rm rabbit52/boot2docker > boot2docker.iso