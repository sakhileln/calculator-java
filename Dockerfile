FROM openjdk:17-jdk-slim

WORKDIR /app

COPY src/ src/
COPY test/ test/
COPY lib/ lib/
COPY Makefile .
COPY .release-tag .release-tag
COPY README.md .

RUN apt-get update && apt-get install -y make

RUN make build

CMD ["make", "run"]
