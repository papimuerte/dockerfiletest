FROM ubuntu:latest AS builder
ARG DOCKERHUB_USERNAME
ARG DOCKERHUB_TOKEN
    
RUN apt-get update && apt-get install -y docker.io
    
RUN echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
    
    # Perform actions that require Docker Hub access, e.g., pulling images
RUN docker pull papimuerte/dockertest:test
    
    # Copy necessary artifacts to the next stage
RUN mkdir /app && cp -r /path/to/your/app /app
    
    # Final stage
FROM alpine:latest
COPY --from=builder /app /app
    
    # Your final image setup
CMD ["/app/start"]


