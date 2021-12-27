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
       run_test!
      end

      response '422', 'invalid request' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end


  

end
