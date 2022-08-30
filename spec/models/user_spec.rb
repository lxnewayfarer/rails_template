# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  context 'creating model' do
    it 'is valid' do
      expect(subject.save).to be_truthy
    end
  end
end
