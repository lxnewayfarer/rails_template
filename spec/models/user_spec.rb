# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'when creating model' do
    it 'is valid' do
      expect(user.save).to be_truthy
    end
  end
end
