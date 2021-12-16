require 'swagger_helper'

RSpec.describe 'api/v1/user', type: :request do
  path '/users' do

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

        let(:id) { User.create(username: 'Teste Swagger', email: 'teste@swagger.com').id }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/signup' do
    post 'Register into store' do
      tags 'Users'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :password }
        },
        required: ["username", "email", "password"],
      }
      
      response "201", "user created" do
        let(:user) { { patient_id: 10, provider_id: 1 } }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { { patient_id: 10 } }
        run_test!
      end
    end
  end
end
