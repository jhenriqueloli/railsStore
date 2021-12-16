require 'swagger_helper'

RSpec.describe 'api/v1/store', type: :request do


  path '/' do

    get 'Get a list of products' do
      tags 'Products'
      produces 'application/json', 'application/xml'
      
      response '200', 'Products found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            warrrancy: { type: :string },
            price: { type: :float },
            quantity: { type: :integer }
          },
          required: [ 'id', 'name', 'warrrancy', 'price', 'quantity' ]

        let(:id) { Vape.create(name: 'Vape Swagger', warrrancy: '36', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '422', 'invalid request' do
        let(:vape) { { title: 'foo' } }
        run_test!
      end
    end
  end

end
