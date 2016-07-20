module Sitomania
  module Parsers
    class Ica < Base

      domain /ica\.se/

      def parse

        Metadata.build do |data|

          data.canonical_url = hangry.canonical_url
          data.name = hangry.name

          list = doc.css('[itemprop="recipeInstructions"] ol > li').map(&:text)
          data.instructions = list.join("\n")

          ingredients = doc.css('.ingredients ul li').map(&:text)
          data.ingredients = sanitize(ingredients)

        end

      end

    end
  end
end
