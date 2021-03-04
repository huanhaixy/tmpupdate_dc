FROM node:15.10.0-alpine3.10
ENV BUILDER_VERSION=1.0
LABEL io.k8s.description=web build io.k8s.display-name=subversion io.openshift.tags=builder,web io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
ENV APP_ROOT=/ng-base
WORKDIR /ng-base
RUN mkdir -p /usr/libexec/
COPY ./s2i /usr/libexec/
RUN apk update; \
    apk add git; \
	apk add npm
ADD package.json .
RUN npm install .
