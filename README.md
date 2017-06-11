List s3 objects shared through CloudFront

# Docker

## Build image

```shell
docker build -t spyopener/s3_cf_browser:latest .
```

## Run
docker run --rm -e AWS_REGION=eu-west-1 -e AWS_ACCESS_KEY_ID=A23232KJK8JJJ99UI5UA -e AWS_SECRET_ACCESS_KEY=Z1Lprsd5ri6amSAdwMcfyqNY7 -p 8080:9292 spyopener/s3_cf_browser
