FROM --platform=linux/arm/v7 arm32v7/postgres:16.3-alpine3.19

RUN apk add --no-cache git build-base build-base postgresql-dev gcc g++ make && \
    git clone --branch v0.7.4 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install && \
    cd .. && \
    rm -rf pgvector && \
    apk del git build-base