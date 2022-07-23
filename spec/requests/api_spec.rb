require 'swagger_helper'

RSpec.describe 'API' do
  path '/api/v1/signup' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[name status]
      }

      response '201', 'user created successfully' do
        let(:user) { { name: 'Bob', status: :ok } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Tom' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieves a user\s posts' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter user_id: :user_id, in: :path, type: :string

      response '200', 'Posts found' do
        schema type: :object,
               properties: {
                 user_id: { type: :integer },
                 email: { type: :string },
                 password: { type: :string }
               },
               required: %w[user_id status]

        let(:user_id) { User.create(name: 'Bob', photo: 'https://cdn-icons-png.flaticon.com/128/527/527489.png', bio: 'Web developer', email: 'bob@example.com', password: '123456', role: 'admin').id }
        run_test!
      end

      response '404', 'User not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end
end
