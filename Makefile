SHELL := /bin/bash

IMAGE_NAME=myimage
DOCKER_REPO=myusername
DOCKERFILE=./app/Dockerfile
DOCKER_TAG=1.0

#Prompt for docker username and password
DOCKER_USERNAME ?= $(shell read -p "Enter Docker username: " u && echo $$u)
DOCKER_PASSWORD ?= $(shell read -s -p "Enter Docker password: " p && echo $$p)

#install kind
install-kind:
    @echo "Installing kind..."
	./install-kind.sh 

#build docker image
docker-build:
    docker build -t $(IMAGE_NAME):$(DOCKER_TAG) -f $(DOCKERFILE) .

#login to docker
docker-login:
    @echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin

#push image to docker
docker-push: docker-login
    docker tag $(IMAGE_NAME):$(DOCKER_TAG) $(DOCKER_REPO)/$(IMAGE_NAME):$(DOCKER_TAG)
    docker push $(DOCKER_REPO)/$(IMAGE_NAME):$(DOCKER_TAG)

#initialize terraform
init:
    cd ./terraform && terraform init

#run terraform plan
plan: init
    cd ./terraform && terraform plan

#run terraform apply
apply: init
    cd ./terraform && terraform apply

#destroy terraform
destroy:
	cd ./terraform && terraform destroy

all: install-kind docker-build docker-login docker-push init plan apply 

.PHONY: install-kind docker-build docker-login docker-push init plan apply destroy all
	