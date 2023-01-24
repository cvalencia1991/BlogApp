require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http index success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'returns http show success' do
      get :index, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get :index, params: { id: 1 }
      expect(response).to render_template(:index)
    end
  end
end
