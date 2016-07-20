module Sitomania
  class Metadata

    ATTRIBUTES = [:instructions, :ingredients,
      :canonical_url, :name, :image_url]

    attr_accessor *ATTRIBUTES

    def initialize(attrs = {})
      attrs.each do |key, value|
        public_send("#{key}=", value)
      end
    end

    def self.build(&block)
      new.tap { |x| block.call(x) }
    end

    def attributes(keys = ATTRIBUTES)
      Hash[keys.map { |key| [key, send(key)] }]
    end

  end
end
