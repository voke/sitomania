module Sitomania
  module Parsers
    class Arla < Base

      domain /arla\.se/

      def parse

        Metadata.build do |data|

          data.canonical_url = hangry.canonical_url
          data.instructions = hangry.instructions
          data.name = hangry.name

          ingredients = doc.css('[itemprop=recipeIngredient]').map(&:text)
          data.ingredients = sanitize(ingredients)

        end

      end

    end
  end
end
