require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'returns http index success' do
      get('/users')
      expect(response).to have_http_status(:success)
    end
    it 'returns http index success' do
      get('/users')
      expect(response).to render_template(:index)
    end
    it 'ensures the body to include the correct placeholder text' do
      get('/users')
      expect(response.body).to include('Welcome to user index page')
    end
  end

  describe 'GET /show' do
    it 'returns http show success' do
      get '/users/:id', params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'returns render template Show' do
      get '/users/:id', params: { id: 1 }
      expect(response).to render_template(:show)
    end
    it 'ensures the body to include the correct placeholder text' do
      get '/users/:id', params: { id: 1 }
      expect(response.body).to include('These are a user for a Id')
    end
  end
end
