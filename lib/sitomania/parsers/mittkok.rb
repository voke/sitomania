module Sitomania
  module Parsers
    class Mittkok < Base

      domain(/mittkok\.expressen\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          ingredients = doc.css('[itemprop=recipeIngredient]').map(&:text)
          sanitize(ingredients)
        end

      end

    end
  end
end
