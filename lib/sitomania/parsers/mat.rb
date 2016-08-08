module Sitomania
  module Parsers
    class Mat < Base

      domain(/mat\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          doc.css('.ingr_name').map do |elm|
            value = elm.at_css('[itemprop=amount]').text rescue nil;
            name = elm.at_css('[itemprop=name]').text
            "#{value} #{name}".strip
          end
        end

      end

    end
  end
end
