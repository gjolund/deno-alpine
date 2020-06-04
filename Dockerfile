FROM frolvlad/alpine-glibc

WORKDIR /root/

ENV DENO_VERSION=1.0.5

# Install deno
RUN apk add --virtual .download --no-cache curl \
  && curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip \
          --output deno.zip \
  && unzip deno.zip \
  && rm deno.zip \
  && chmod 777 deno \
  && mv deno /bin/deno \
  && apk del .download