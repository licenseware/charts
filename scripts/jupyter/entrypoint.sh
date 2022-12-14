#!/bin/bash -e

# check if pip-extras is not empty and the directory is not empty
if [[ -d ${PIP_EXTRAS} ]] && [[ -n "$(ls -A ${PIP_EXTRAS})" ]]; then
    echo "Installing from ${PIP_EXTRAS} ..."
    ls ${PIP_EXTRAS}
    find ${PIP_EXTRAS} -name 'requirements*.txt' -exec pip install -r {} \;
fi

TMP=$(mktemp)
sed "s/PORT/${PORT:-8888}/g; s/TOKEN/${TOKEN:-lware}/g" /jupyter_notebook_config.py > ${TMP}
cp ${TMP} /jupyter_notebook_config.py

exec jupyter notebook --config /jupyter_notebook_config.py
