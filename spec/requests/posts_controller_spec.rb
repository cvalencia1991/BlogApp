require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns http index success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end
    it 'returns http index success' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end
    it 'ensures the body to include the correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Posts for the users')
    end
  end

  describe 'GET /show' do
    it 'returns http show success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
    it 'ensures the body to include the correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Post information!')
    end
  end
end
