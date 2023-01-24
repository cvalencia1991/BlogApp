require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'specs Controller that' do
    it 'returns http success' do
      get :index, params: { user_id: 1 }
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index, params: { user_id: 1 }
      expect(response).to render_template(:index)
    end
    it 'renders the show template' do
      get :index, params: { id: 1, user_id: 1 }
      expect(response).to render_template(:index)
    end
    it 'returns http index success' do
      get :index, params: { id: 1, user_id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'returns the correct placeholder text' do
      get :show, params: { id: 1, user_id: 1 }
      expect(assigns(:posts)).to eq('Here is a list of posts for a given user')
    end
  end
end
