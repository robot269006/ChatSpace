require 'rails_helper'

describe Message do
  describe '#create' do
    let(:message) { build(:message) }
    it 'is valid with body, user_id, group_id, created_at and updated_at' do
      message.valid?
    end

    let(:message) { build(:message, body: "" ) }
    it 'is invalid with a blank body' do
      message.valid?
      expect(message.errors[:body]).to include("can't be blank")
    end

  end
end
