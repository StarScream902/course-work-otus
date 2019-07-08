#!/bin/bash
set -e

APP_DIR=${1:-$HOME}

git clone https://github.com/express42/search_engine_crawler $APP_DIR/ui
cd $APP_DIR/ui
pip install -r requirements.txt

git clone https://github.com/express42/search_engine_crawler $APP_DIR/ui
cd $APP_DIR/crawler
pip install -r requirements.txt
