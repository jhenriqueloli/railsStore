require 'swagger_helper'

RSpec.describe 'api/v1', type: :request do

  path '/consumer/accessories' do

    get 'Get a list of accessories' do
      tags 'Accessory'
      produces 'application/json', 'application/xml'
      
      response '200', 'Accessories found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            brand: { type: :string },
            price: { type: :float },
            quantity: { type: :integer }
          },
          required: [ 'id', 'name', 'brand', 'price', 'quantity' ]

        let(:id) { Accessory.create(name: 'Accessory Swagger', brand: 'Accessory Swagger Brand', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/consumer/accessories/{id}' do

    get 'Retrieves a accessory' do
      tags 'Accessory'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'accessory found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            brand: { type: :string },
            price: { type: :float },
            quantity: { type: :integer }
          },
          required: [ 'id', 'name', 'brand', 'price', 'quantity' ]

        let(:id) { Accessory.create(name: 'Accessory Swagger', brand: 'Accessory Swagger Brand', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '404', 'Accessory not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/consumer/accessories' do
    post 'Create a new Accessory' do
      tags 'Accessory'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :accessory, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          brand: { type: :string },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: [ 'id', 'name', 'brand', 'price', 'quantity' ]
      }
      
      response "201", "accessory updated successfully" do
        let(:accessory) { Accessory.create( name: "accessory swagger", brand: "accessory brand swagger", price: "20", quantity: "100") }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end

  path '/consumer/accessories/{id}' do
    patch 'Update a Accessory' do
      tags 'Accessory'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :accessory, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          brand: { type: :string },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: [ 'id', 'name', 'brand', 'price', 'quantity' ]
      }
      
      response "201", "accessory updated successfully" do
        let(:accessory) { Accessory.create( name: "accessory swagger", brand: "accessory brand swagger", price: "20", quantity: "100") }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end

  path '/consumer/accessories/{id}' do

    delete 'Delete a accessory' do
      tags 'Accessory'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'accessory deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            brand: { type: :string },
            price: { type: :float },
            quantity: { type: :integer }
          },
          required: [ 'id', 'name', 'brand', 'price', 'quantity' ]

        let(:id) { Accessory.create(name: 'Accessory Swagger', brand: 'Accessory Swagger Brand', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '404', 'Accessory not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end