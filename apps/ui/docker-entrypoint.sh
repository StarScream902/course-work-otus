#!/bin/sh

cd ui
FLASK_APP=ui.py gunicorn ui:app -b 0.0.0.0
