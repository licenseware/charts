ARG BASE_IMAGE_REPOSITORY=ghcr.io/licenseware/licenseware-sdk-v2
ARG BASE_IMAGE_TAG=latest
ARG ODBC_DIR=/odbc

FROM ${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_TAG} AS base

LABEL author="Meysam Azad <meysam@licenseware.io>"

ARG PIP_EXTRAS=/pip.d
ARG NOTEBOOK_VERSION=6.4.12

ENV PIP_EXTRAS=${PIP_EXTRAS} PORT=8888

EXPOSE ${PORT}

USER root
RUN pip install -U pip jupyter notebook==${NOTEBOOK_VERSION}
USER ${USER}

COPY --chown=${USER} . /

CMD ["/entrypoint.sh"]

FROM curlimages/curl as odbc-init

ARG ODBC_DIR
WORKDIR ${ODBC_DIR}

USER root
RUN apk add --update gnupg && \
    curl -sSLO https://packages.microsoft.com/keys/microsoft.asc && \
    curl -sSLo mssql-release.list https://packages.microsoft.com/config/debian/10/prod.list

FROM base AS odbc

ARG ODBC_DIR
USER root

COPY --from=odbc-init ${ODBC_DIR}/microsoft.asc /etc/apt/trusted.gpg.d/
COPY --from=odbc-init ${ODBC_DIR}/mssql-release.list /etc/apt/sources.list.d/

RUN apt update && \
    apt install -y build-essential unixodbc-dev && \ 
    ACCEPT_EULA=Y apt install -y msodbcsql18

USER ${USER}

FROM base AS latest
