module Sitomania
  module Parsers
    class Mat < Base

      domain /mat\.se/

      def parse

        Metadata.build do |data|
          data.canonical_url = hangry.canonical_url
          data.name = hangry.name
          data.instructions = hangry.instructions
          data.ingredients = doc.css('.ingr_name').map do |elm|
            value = elm.at_css('[itemprop=amount]').text rescue nil;
            name = elm.at_css('[itemprop=name]').text
            "#{value} #{name}".strip
          end
        end

      end

    end
  end
end
