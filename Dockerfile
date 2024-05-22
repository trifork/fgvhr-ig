FROM nginx:1.26.0-alpine AS base
EXPOSE 8080 8081

# Set to run as non-root user
RUN addgroup --system --gid 1000 customgroup \
    && adduser --system --uid 1000 --ingroup customgroup --shell /bin/sh customuser
    
RUN chown customuser:customgroup -R /usr/share/nginx/html

# Override NGINX's default.conf and nginx.conf
COPY ./nginx/nginx-template.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/stub-status.conf /etc/nginx/conf.d/stub-status.conf
COPY ./nginx/security-headers.conf /etc/nginx/security-headers.conf

RUN chown -R 1000: /etc/nginx/conf.d/default.conf



# Use Ruby as build. It will not be published, but will 
# generate files to /output
FROM ruby:3.2 as build

# https://github.com/inadarei/alpine-jekyll/blob/master/Dockerfile
RUN gem install --no-document \
        redcarpet \
        kramdown \
        maruku \
        rdiscount \
        RedCloth \
        liquid \
        pygments.rb \
        safe_yaml \
        jekyll \
        jekyll-paginate \
        jekyll-sass-converter \
        jekyll-sitemap \
        jekyll-feed \
        jekyll-redirect-from

# add node
RUN apt-get update && apt-get install nodejs npm --no-install-recommends -y --fix-missing

# add java
RUN apt-get install -y openjdk-17-jdk
ENV JAVA_HOME /usr/lib/jvm/java-1.17-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.17-openjdk/jre/bin:/usr/lib/jvm/java-1.17-openjdk/bin

# add misc
RUN apt-get install -y curl jq --no-install-recommends

# anticipate source mounted to /src
RUN mkdir -p /src
WORKDIR /src

# Handle Jekyll error because it can't create the following folder
RUN mkdir ./temp/pages/.jekyll-cache ./output -p



# Make it skip installation process, because it's always the same
FROM build as worker
ARG FSH_SUSHI_VERSION=3.10.0

# add the sushi tool
RUN npm install -g fsh-sushi@${FSH_SUSHI_VERSION}

# Copy all allowed content to the root directory
COPY . .

# Allow the following .sh files to be executed
RUN chmod u+x ./_downloadPublisher.sh ./_genonce.sh

# Update the publisher to the newest version, so it is ready to run on command
RUN ./_downloadPublisher.sh
RUN ./_genonce.sh




FROM base AS final

# Get files to be served
COPY --from=worker ./src/output /usr/share/nginx/html

# Change to user 1000
USER 1000
