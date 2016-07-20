module Sitomania
  module Parsers
    class Ica < Base

      domain /ica\.se/

      class Metadata < Sitomania::Metadata

        def instructions
          list = doc.css('[itemprop="recipeInstructions"] ol > li').map(&:text)
          list.join("\n")
        end

        def ingredients
          ingredients = doc.css('.ingredients ul li').map(&:text)
          sanitize(ingredients)
        end

      end

    end
  end
end
