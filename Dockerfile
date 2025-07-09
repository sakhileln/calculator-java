FROM openjdk:17-jdk-slim

WORKDIR /app

COPY src/ src/
COPY test/ test/
RUN mkdir lib
COPY lib/ lib/
COPY Makefile .
COPY .release-tag .release-tag
COPY README.md .

RUN apt-get update && apt-get install -y make curl

RUN curl -L -o lib/junit-4.13.2.jar https://repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar && \
    curl -L -o lib/hamcrest-core-1.3.jar https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

RUN make build

CMD ["make", "run"]
