## Variables
IMAGE_NAME=unbound-dns
VERSION=latest
REPO=guidcruncher

.PHONY: build run stop publish clean

# Build the Docker image
build:
	@echo "Building image $(IMAGE_NAME):$(VERSION)..."
	docker build -t $(IMAGE_NAME):$(VERSION) .

# Run the container using docker compose
run:
	@echo "Starting container..."
	docker compose up -d --build

# Stop and remove the container
stop:
	@echo "Stopping container..."
	docker compose down

# Publish the image to a registry
# Note: This requires you to be logged into your registry via 'docker login'
publish: build
	@echo "Tagging and pushing $(IMAGE_NAME):$(VERSION)..."
	docker tag $(IMAGE_NAME):$(VERSION) $(REPO)/$(IMAGE_NAME):$(VERSION)
	docker push $(REPO)/$(IMAGE_NAME):$(VERSION)

# Clean up local images
clean:
	@echo "Removing local image..."
	docker rmi $(IMAGE_NAME):$(VERSION) || true

shell:
	docker compose exec -i -t unbound sh
