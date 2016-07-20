require 'open-uri'
require 'nokogiri'

module Sitomania
  module Parsers
    class Base

      attr_accessor :url, :doc

      def initialize(url)
        self.url = url
      end

      def self.domain(pattern)
        @domain = pattern
        Sitomania.register(self, pattern)
      end

      def doc
        @doc ||= Nokogiri::HTML(response_body)
      end

      def hangry
        @hangry ||= Hangry.parse(response_body)
      end

      def sanitize(*strings)
        Array(strings).flatten.map do |string|
          string.gsub("\n", ' ').squeeze(' ').strip
        end
      end

      def response_body
        @response ||= open(url).read
      end

      def parse
        raise(NotImplementedError)
      end

      def self.parse(url)
        new(url).parse
      end

    end
  end
end
