module Sitomania
  module Parsers
    class Koket < Base

      domain(/koket\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          doc.css('#ingredients li').map do |elm|
            value = elm.at_css('.ingredient').text rescue nil
            name = elm.at_css('[itemprop=ingredients]').text
            "#{value} #{name}".strip
          end
        end

      end

    end
  end
end
