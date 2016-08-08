require 'test_helper'

describe Sitomania::Parsers::Ica do

  subject { Sitomania::Parsers::Ica }
  let(:target_url) { "http://www.ica.se/recept/rostbiff-357630/" }

  it "returns metadata" do

    VCR.use_cassette('ica') do

      parser = Sitomania::Parsers::Ica.new(target_url)
      metadata = parser.parse

      metadata.instructions.must_match(/Sätt ugnen på 125/i)
      metadata.ingredients.size.must_equal 3
      metadata.canonical_url.must_equal target_url
      metadata.image_url.must_equal 'http://www.ica.se/imagevaultfiles/id_66285/cf_1286/rostbiff.jpg'
      metadata.name.must_equal 'Rostbiff'

    end

  end

end
