require 'sitomania/version'

require 'hangry'
require 'sitomania/metadata'

module Sitomania

  ParserNotFoundError = Class.new(StandardError)

  def self.parsers
    @@parsers ||= {}
  end

  def self.register(parser_class, identifier)
    parsers[identifier] = parser_class
  end

  def self.support
    parsers.values.map(&:identifier).join(', ')
  end

  def self.find_parser(host)
    parser = parsers.find do |pattern, klass|
      host =~ pattern
    end
    if parser
      parser[1]
    else
      raise(ParserNotFoundError, "No parser found for #{host.inspect}")
    end
  end

  def self.parse(url)
    uri = URI.parse(url)
    parser = find_parser(uri.host)
    parser.parse(uri)
  end

end

require 'sitomania/parsers'
