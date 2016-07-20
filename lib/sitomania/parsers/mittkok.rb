module Sitomania
  module Parsers
    class Mittkok < Base

      domain /mittkok\.expressen\.se/

      def parse

        Metadata.build do |data|
          data.canonical_url = hangry.canonical_url
          data.name = hangry.name
          data.instructions = hangry.instructions
          ingredients = doc.css('[itemprop=recipeIngredient]').map(&:text)
          data.ingredients = sanitize(ingredients)
        end

      end

    end
  end
end
