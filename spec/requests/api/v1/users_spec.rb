require 'swagger_helper'

RSpec.describe 'api/v1', type: :request do

  path '/users' do
    post 'Register into application' do
      tags 'Users'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: ["username", "email", "password"],
      }
      
      response "201", "user created" do
        let(:user) { { username: "Florinda", email: "florinda@gmail.com", password: "123456"  } }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { { username: "Florinda" } }
        run_test!
      end
    end
  end

  path '/edit' do
    patch 'Update User informations' do
      tags 'Users'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string }
        },
        required: ["username", "email"],
      }
      
      response "201", "user updated" do
        let(:user) { { username: "Florinda Update", email: "florinda@gmail.com", password: "123456"  } }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { { username: "Florinda" } }
        run_test!
      end
    end
  end

  path '/users/sign_in' do
    post 'Log in into application' do
      tags 'Users'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ["email", "password"],
      }
      
      response "201", "user logged in" do
        let(:user) { { email: "joao@henrique", password: "123456" } }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { { email: "10" } }
        run_test!
      end
    end
  end
end
