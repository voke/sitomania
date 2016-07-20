module Sitomania
  class Metadata

    ATTRIBUTES = [:instructions, :ingredients,
      :canonical_url, :name, :image_url]

    attr_writer *ATTRIBUTES

    attr_accessor :doc, :hangry

    def initialize(doc, hangry)
      self.doc = doc
      self.hangry = hangry
    end

    def instructions
      hangry.instructions
    end

    def ingredients
      []
    end

    def canonical_url
      hangry.canonical_url
    end

    def name
      hangry.name
    end

    def image_url
      hangry.image_url
    end

    def self.build(&block)
      new.tap { |x| block.call(x) }
    end

    def sanitize(*strings)
      Array(strings).flatten.map do |string|
        string.gsub("\n", ' ').squeeze(' ').strip
      end
    end

    def inspect
      "#<#{self.class.name} #{inspect_attributes.join(', ')}>"
	  end

    def inspect_attributes
      attributes.map do |name, value|
        "#{name}: #{value.inspect}"
      end
    end

    def attributes(keys = ATTRIBUTES)
      Hash[keys.map { |key| [key, send(key)] }]
    end

  end
end
