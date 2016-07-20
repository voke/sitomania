module Sitomania
  module Parsers
    class Koket < Base

      domain /koket\.se/

      def parse

        Metadata.build do |data|
          data.canonical_url = hangry.canonical_url
          data.name = hangry.name
          data.instructions = hangry.instructions
          data.ingredients = doc.css('#ingredients li').map do |elm|
            value = elm.at_css('.ingredient').text rescue nil
            name = elm.at_css('[itemprop=ingredients]').text
            "#{value} #{name}".strip
          end
        end

      end

    end
  end
end
