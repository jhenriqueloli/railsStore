require 'swagger_helper'

RSpec.describe 'api/v1', type: :request do

  path '/consumer/essences' do

    get 'Get a list of essences' do
      tags 'Essence'
      produces 'application/json', 'application/xml'
      
      response '200', 'Essences found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            brand: { type: :string },
            flavor: { type: :string },
            size: { type: :float },
            strength: { type: :string },
            price: { type: :float },
            quantity: { type: :integer }
          },
          required: [ 'id', 'name', 'brand', 'price', 'quantity' ]

        let(:id) { Essence.create(name: 'Essence Swagger', brand: 'Essence Swagger Brand', flavor: 'apple', 'size': '30', strength: 'hard', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/consumer/essences/{id}' do

    get 'Retrieves a essence' do
      tags 'Essence'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'essence found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          brand: { type: :string },
          flavor: { type: :string },
          size: { type: :float },
          strength: { type: :string },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: [ 'id', 'name', 'brand', 'price', 'quantity' ]
      
      let(:id) { Essence.create(name: 'Essence Swagger', brand: 'Essence Swagger Brand', flavor: 'apple', 'size': '30', strength: 'hard', price: '29.90', quantity: '20').id }
      run_test!
      end

      response '404', 'Essence not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/consumer/essences' do
    post 'Create a new Essence' do
      tags 'Essence'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :essence, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          brand: { type: :string },
          flavor: { type: :string },
          size: { type: :float },
          strength: { type: :string },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: [ 'name', 'brand', 'price', 'quantity' ]
      }

      response "201", "essence created successfully" do
        let(:essence) { Essence.create(name: 'Essence Swagger', brand: 'Essence Swagger Brand', flavor: 'apple', 'size': '30', strength: 'hard', price: '29.90', quantity: '20') }
        run_test!
      end

      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end

  path '/consumer/essences/{id}' do
    patch 'Update a Essence' do
      tags 'Essence'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :essence, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          brand: { type: :string },
          flavor: { type: :string },
          size: { type: :float },
          strength: { type: :string },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: [ 'id', 'name', 'brand', 'price', 'quantity' ]
      }

      response "201", "essence updated successfully" do
        let(:essence) { Essence.create(name: 'Essence Swagger', brand: 'Essence Swagger Brand', flavor: 'apple', 'size': '30', strength: 'hard', price: '29.90', quantity: '20') }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end
  
  path '/consumer/essences/{id}' do

    delete 'Delete a essence' do
      tags 'Essence'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'essence deleted' do
        schema type: :object,
        properties: {
          id: { type: :integer }
        },
        required: [ 'id' ]
      
      let(:id) { Essence.create(name: 'Essence Swagger', brand: 'Essence Swagger Brand', flavor: 'apple', 'size': '30', strength: 'hard', price: '29.90', quantity: '20').id }
      run_test!
      end

      response '404', 'Essence not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end
