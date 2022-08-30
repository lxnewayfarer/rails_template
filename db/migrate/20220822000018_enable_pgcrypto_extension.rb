# frozen_string_literal: true

# Using uuid
class EnablePgcryptoExtension < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end
