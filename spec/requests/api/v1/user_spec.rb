require 'swagger_helper'

RSpec.describe 'api/v1/user', type: :request do
  path '/consumer/users' do

    get 'Get a list of users' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      
      response '200', 'Users found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            username: { type: :string },
            email: { type: :string }
          },
          required: [ 'id', 'username', 'email' ]

          let(:id) { User.create(title: 'foo', content: 'bar').id }
          run_test!
      end

      response '422', 'invalid request' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
