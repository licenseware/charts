#!/bin/bash -eu

if [[ -d ${PIP_EXTRAS} ]]; then
    echo "Installing from ${PIP_EXTRAS} ..."
    ls ${PIP_EXTRAS}
    find ${PIP_EXTRAS} -name 'requirements*.txt' -exec pip install -r {} \;
fi

exec jupyter notebook --config /jupyter_notebook_config.py
