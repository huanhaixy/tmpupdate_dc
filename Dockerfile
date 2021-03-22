FROM node:12.12-alpine
ENV BUILDER_VERSION=1.0
LABEL io.k8s.description="web build"
LABEL io.k8s.display-name=subversion
LABEL io.openshift.tags=builder,web
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
ENV APP_ROOT=/ng-base
WORKDIR /ng-base
RUN mkdir -p /usr/libexec/
COPY ./s2i /usr/libexec/
RUN apk update; \
    apk add git; \
	apk add npm python2 python3  pkgconfig pixman pixman-dev cairo-dev pango-dev pango make g++ gcc
ADD package.json .
ADD package-lock.json .
RUN npm install
