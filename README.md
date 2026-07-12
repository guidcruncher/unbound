  

# Unbound Recursive DNS Server (Alpine)

This project provides a lightweight, Docker-based Unbound recursive DNS resolver, optimized for Raspberry Pi 5 (aarch64) and other ARM64 systems.

## Prerequisites

-   Docker and Docker Compose installed on your host system.
-   Port 5335 (or 53) available on your host.

## Quick Start

1.  **Build the image:**  
    `make build`
2.  **Start the container:**  
    `make run`
3.  **Verify functionality:**  
    Use `dig` to test that the server is resolving queries:  
    `dig @127.0.0.1 -p 5335 google.com`

## Configuration

This setup uses a volume-mounted `unbound.conf`. Ensure you have an appropriate `unbound.conf` in your project directory.

See the "examples" folder for an example Docker compose file integrating it with Pi-hole using the example compose file from [The Pi-hole website here](https://docs.pi-hole.net/docker/)

### Environment Variables

You can customize your configuration by passing environment variables via `docker-compose.yml` and using an entrypoint script to inject them at runtime.

## Reference

The setup and configuration guidelines for this recursive DNS resolver were inspired by the official Pi-hole documentation:

[Pi-hole: Setting up Unbound as a recursive DNS server](https://docs.pi-hole.net/guides/dns/unbound)

## Makefile Commands

-   `make build` : Builds the Docker image.
-   `make run` : Starts the container using `docker compose`.
-   `make stop` : Stops and removes the container.
-   `make publish`: Builds and pushes the image to a registry.
-   `make clean` : Removes the local Docker image.
-   `make shell` : Opens a shell in the container.
