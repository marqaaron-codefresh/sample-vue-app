FROM alpine:3.13 AS imagestep1
ARG VERSION='dev'
ARG WEB_SERVER='nginx'
RUN apk add --no-cache bash
COPY /scripts /scripts
RUN ["chmod", "+x", "/scripts/build/imagestep1.sh"]
RUN ["/bin/bash","-c","/scripts/build/imagestep1.sh"]

FROM imagestep1 AS imagestep2
WORKDIR /ui
COPY /app ./app
RUN ["/bin/bash","-c","/scripts/build/imagestep2.sh"]

FROM imagestep1
MAINTAINER MarqAAron
COPY --from=imagestep2 /ui /ui
ENTRYPOINT ["/bin/bash","-c","/scripts/startup.sh"]
EXPOSE 8082