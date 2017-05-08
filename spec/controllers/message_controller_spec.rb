require 'rails_helper'

describe MessagesController do
  context 'user signed in' do
    let(:group)   { create(:group) }
    let(:message) { create(:message) }
    let(:user)    { create(:user) }
    login_user

    describe 'GET #index' do
      it 'assigns @messages instance correctly' do
        messages = create_list(:message, 5, group_id: group.id)
        get :index, params: { group_id: group.id}
        expect(assigns(:messages)).to match(messages.sort{ |a, b| a.created_at <=> b.created_at })
      end

      it 'renders index correctly' do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
    end

  end
end
