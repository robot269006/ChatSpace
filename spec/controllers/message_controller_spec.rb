require 'rails_helper'

describe MessagesController do
  context 'user signed in' do
    login_user
    let(:group)   { create(:group) }
    let(:message) { create(:message) }
    let(:user)    { create(:user) }
    let(:message_params) do
      { message: attributes_for(:message), group_id: group, user_id: user }
    end

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

    describe 'POST #create' do
      context 'message saving succeeds' do
        it 'saves the messages with @message instance' do
          expect{post :create, params: message_params}.to change(Message, :count).by(1)
        end

        it 'redirects to group messages path' do
          post :create, params: message_params
          expect(response).to redirect_to root_path(group)
        end
      end

      context 'message saving fails' do
        it 'renders index when message saving fails' do
          get :index, params: {group_id: group.id}
          expect(response).to render_template :index
        end
      end
    end

  end
end
