
require 'sitomania/parsers/base'

Dir[File.expand_path('../parsers/*.rb', __FILE__)].each do |file|
  require(file)
end
