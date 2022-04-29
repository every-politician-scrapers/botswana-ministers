#!/bin/bash

cd sources/enwiki/

bundle exec ruby scraper.rb > scraped.csv
wd sparql -f csv wikidata.js | sed -e 's/T00:00:00Z//g' | qsv dedup -s psid > wikidata.csv
bundle exec ruby diff.rb | tee diff.csv

cd ~-
