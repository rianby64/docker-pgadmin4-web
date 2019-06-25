
docker build -t pgadmin4-ct .

docker run -d --rm \
    --name pgadmin4-ct \
    -p 8080:80 \
    pgadmin4-ct
