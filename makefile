make:
	docker run --rm rabbit52/boot2docker > boot2docker.iso
build:
	docker build -t rabbit52/boot2docker .
