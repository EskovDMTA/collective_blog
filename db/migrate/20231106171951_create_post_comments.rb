# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.1]
  def change
    create_table :post_comments do |t|
      t.string :content

      t.string 'ancestry', collation: 'C', null: false
      t.index 'ancestry'

      t.timestamps
    end
  end
end
