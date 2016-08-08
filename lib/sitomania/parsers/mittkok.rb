module Sitomania
  module Parsers
    class Mittkok < Base

      domain(/mittkok\.expressen\.se/)

      class Metadata < Sitomania::Metadata

        def ingredients
          list = doc.css('[itemprop=recipeIngredient]').map(&:text)
          sanitize(list)
        end

      end

    end
  end
end
