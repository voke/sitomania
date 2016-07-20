$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sitomania'
require 'vcr'

require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'

Minitest::Reporters.use!
WebMock.enable!

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end
