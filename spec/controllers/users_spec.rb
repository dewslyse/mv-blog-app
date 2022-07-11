require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the index template' do
      expect(response).to render_template('index')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template('show')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the show template' do
      expect(response).to render_template('show')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template('index')
    end
  end
end