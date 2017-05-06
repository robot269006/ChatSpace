require 'rails_helper'
describe Message do
  describe '#create' do
    it 'is valid with body, user_id, group_id, created_at and updated_at' do
      message = build(:message)
      message.valid?
    end
    it 'is invalid with a blank body' do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("can't be blank")
    end
  end
end
