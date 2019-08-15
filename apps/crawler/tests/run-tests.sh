#!/bin/sh

pip install -r ../requirements.txt -r ../requirements-test.txt

python -m unittest discover -s ./

coverage run -m unittest discover -s ./

coverage report --include crawler/crawler.py
