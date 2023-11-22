# frozen_string_literal: true

class ChangeNullValueInPostComments < ActiveRecord::Migration[7.1]
  def change
    change_column :post_comments, :ancestry, :string, default: '#', null: true
  end
end
