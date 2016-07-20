module Sitomania
  module Parsers
    class Recept < Base

      domain /recept\.se/

      def parse

        Metadata.build do |data|
          data.canonical_url = hangry.canonical_url
          data.name = hangry.name
          data.instructions = hangry.instructions
          data.ingredients = hangry.ingredients
        end

      end

    end
  end
end
