
podman build -t pgadmin4-ct . && \
podman run -it \
    --name pgadmin4-ct \
    -p 9090:80 \
    pgadmin4-ct
