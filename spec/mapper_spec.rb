require 'mapper'

describe Mapper do
  let(:mapping) do
    {
      product: {
        id: :external_id,
        label: {
          category_id: {
            'Label X' => 13 ,
            'Label Y' => 666 ,
          }
        }
      }
    }
  end

  let(:mapper) { Mapper.new(mapping) }

  let(:output) { mapper.map([{ id: 1, label: 'Label X' }]) }

  it('produces array of Products') do
    expect(output.first).to be_kind_of(Product)
  end

  it('sets external_id') do
    expect(output.first.external_id).to eq(1)
  end

  it('sets category_id') do
    expect(output.first.category_id).to eq(13)
  end
end

class Product
  include Anima.new(:external_id, :category_id)
end
