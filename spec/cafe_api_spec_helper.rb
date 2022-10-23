# frozen_string_literal: true

# require 'simplecov'
# SimpleCov.start

require 'yaml'

# require 'minitest/autorun'
# require 'minitest/rg'
# require 'vcr'
# require 'webmock'

require_relative '../lib/place_api/place_api'

# USERNAME = 'soumyaray'
# PROJECT_NAME = 'YPBT-app'
CONFIG = YAML.safe_load(File.read('config/secrets.yml'))

CAFE_TOKEN = CONFIG['CAFE_NOMAD'][0]['Cafe_api']
CORRECT = YAML.safe_load(File.read('../db/sample/cafe_nomad1.yml'))

CASSETTES_FOLDER = 'spec/fixtures/cassettes'
CASSETTE_FILE = 'cafe_api'