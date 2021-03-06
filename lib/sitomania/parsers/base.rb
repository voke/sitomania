require 'open-uri'
require 'nokogiri'

module Sitomania
  module Parsers
    class Base

      class Metadata < Sitomania::Metadata
      end

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

      def response_body
        @response ||= open(url).read
      end

      def parse
        self.class::Metadata.new(doc, hangry)
      end

      def self.parse(url)
        new(url).parse
      end

    end
  end
end
