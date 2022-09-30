FROM ghcr.io/licenseware/licenseware-sdk-v2:latest AS latest

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
