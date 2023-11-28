# frozen_string_literal: true

class ChangeDefaultAncestryValueInPostComments < ActiveRecord::Migration[7.0]
  def change
    change_column :post_comments, :ancestry, :string, default: 0
  end
end
