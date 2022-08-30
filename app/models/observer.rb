# frozen_string_literal: true

class Observer < ApplicationRecord
  belongs_to :user

  enum kind: {
    vk: 0
  }
end
