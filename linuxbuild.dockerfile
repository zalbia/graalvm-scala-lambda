FROM ghcr.io/graalvm/graalvm-ce:${BASE_IMAGE_TAG:-java11-21.0.0}

WORKDIR /tmp/dist
RUN gu install native-image
CMD native-image -jar /tmp/target/graalvm-scala-lambda.jar --enable-url-protocols=http bootstrap
