require 'rails_helper'

describe MessagesController do
  context 'user signed in' do
    let(:group)   { create(:group) }
    let(:message) { create(:message) }
    let(:user)    { create(:user) }
    login_user

    describe 'GET #index' do
      it 'renders index correctly' do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
    end

  end
end
