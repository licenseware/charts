FROM ghcr.io/licenseware/licenseware-sdk-v2:latest AS base

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

FROM base AS odbc

USER root

RUN apt install -y gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt update && \
    apt install -y build-essential unixodbc-dev && \
    ACCEPT_EULA=Y apt install -y msodbcsql18

USER ${USER}

FROM base AS latest
