module Sitomania
  module Parsers
    class Arla < Base

      domain(/arla\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          list = doc.css('[itemprop=recipeIngredient]').map(&:text)
          sanitize(list)
        end

      end

    end
  end
end
