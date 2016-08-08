require 'test_helper'

describe Sitomania::Parsers::Arla do

  subject { Sitomania::Parsers::Arla }
  let(:target_url) { "http://www.arla.se/recept/thailandsk-flaskfile/" }

  it "returns metadata" do

    VCR.use_cassette('arla') do

      parser = Sitomania::Parsers::Arla.new(target_url)
      metadata = parser.parse

      metadata.instructions.must_match(/gör så här/i)
      metadata.ingredients.size.must_equal 11
      metadata.canonical_url.must_equal target_url
      metadata.name.must_equal 'Thailändsk fläskfilé'

    end

  end

end
