#! /usr/bin/env bash
# Fail fast if something goes wrong.
set -e
mkdir pop_exam
pushd pop_exam
git clone https://github.com/object-oriented-python/pop_exam_config.git
# Create an venv (isolated Python environment)
python -m venv PoP_venv
# Activate the venv
. PoP_venv/Scripts/activate
# Install the required Python packages
python -m pip install -e pop_exam_config/


