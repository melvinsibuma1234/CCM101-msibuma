# MinIO Deployment

## Deployment Environment

MinIO was deployed using Docker in the KillerCoda Ubuntu environment.

## Docker Deployment

The following Docker command was used to deploy MinIO:

```bash
docker run -d \
  --name minio \
  -p 9000:9000 \
  -p 9001:9001 \
  -e MINIO_ROOT_USER=admin \
  -e MINIO_ROOT_PASSWORD=password123 \
  quay.io/minio/minio server /data --console-address ":9001"
