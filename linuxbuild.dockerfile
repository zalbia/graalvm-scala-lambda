FROM ghcr.io/graalvm/graalvm-ce:${BASE_IMAGE_TAG:-java11-21.0.0}

WORKDIR /tmp/dist
RUN gu install native-image
CMD native-image -jar /tmp/target/graalvm-scala-lambda.jar -H:ReflectionConfigurationFiles=/tmp/.graalvm/reflect-config.json --enable-url-protocols=http -J-Xms2G bootstrap