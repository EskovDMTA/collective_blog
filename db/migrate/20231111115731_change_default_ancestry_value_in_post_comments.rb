class ChangeDefaultAncestryValueInPostComments < ActiveRecord::Migration[7.1]
  def change
    change_column :post_comments, :ancestry, :string, default: 0
  end
end
