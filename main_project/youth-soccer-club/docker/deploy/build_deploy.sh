IMAGE_NAME="neilthefisher/comp353-youth-soccer-club"

docker build -t $IMAGE_NAME:latest .
docker push $IMAGE_NAME:latest