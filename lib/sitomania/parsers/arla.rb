module Sitomania
  module Parsers
    class Arla < Base

      domain(/arla\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          doc.css('[itemprop=recipeIngredient]').map(&:text)
          sanitize(ingredients)
        end

      end

    end
  end
end
