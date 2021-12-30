require 'swagger_helper'

RSpec.describe 'api/v1', type: :request do

  path '/consumer/vapes' do

    get 'Get a list of vapes' do
      tags 'Vape'
      produces 'application/json', 'application/xml'
      
      response '200', 'Vapes found' do
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
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/consumer/vapes/{id}' do

    get 'Retrieves a vape' do
      tags 'Vape'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'vape found' do
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

      response '404', 'Vape not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end


  path '/consumer/vapes' do
    post 'Create a new Vape' do
      tags 'Vape'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :vape, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          brand: { type: :string },
          warrancy: { type: :string },
          price: { type: :string },
          quantity: { type: :string }
        },
        required: ["name", "brand", "warrancy", "price", "quantity"],
      }
      
      response "201", "vape updated successfully" do
        let(:vape) { Vape.create( name: "vape swagger", brand: "vape brand swagger", warrancy: "12", price: "20", quantity: "100") }
        run_test!
      end

      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end

  path '/consumer/vapes/{id}' do
    patch 'Update a Vape' do
      tags 'Vape'
      consumes "application/json"
      produces 'application/json', 'application/xml'
      
      parameter name: :vape, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          brand: { type: :string },
          warrancy: { type: :integer },
          price: { type: :float },
          quantity: { type: :integer }
        },
        required: ["id", "name", "brand", "warrancy", "price", "quantity"],
      }
      
      response "201", "vape updated successfully" do
        let(:vape) { Vape.create( name: "vape swagger", brand: "vape brand swagger", warrancy: "12", price: "20", quantity: "100") }
        run_test!
      end
      
      response "422", "invalid request" do
        let(:user) { "invalid request" }
        run_test!
      end
    end
  end

  path '/consumer/vapes/{id}' do

    delete 'Delete a vape' do
      tags 'Vape'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'vape deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer }
            
          },
          required: [ 'id' ]

        let(:id) { Vape.create(name: 'Vape Swagger', warrrancy: '36', price: '29.90', quantity: '20').id }
        run_test!
      end

      response '404', 'Vape not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end
