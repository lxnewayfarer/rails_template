# frozen_string_literal: true

# API Class
class API < Grape::API
  mount V1::Root
end
