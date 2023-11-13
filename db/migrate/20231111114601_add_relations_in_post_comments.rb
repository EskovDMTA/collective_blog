class AddRelationsInPostComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :post_comments, :user, foreign_key: true
    add_reference :post_comments, :post, foreign_key: true
  end
end
