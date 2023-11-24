# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.1]
  def change
    create_table :post_comments do |t|
      t.string :content

      t.string 'ancestry', null: false
      t.index  'ancestry', opclass: :varchar_pattern_ops

      t.timestamps
    end
  end
end

# t.string 'ancestry', collation: 'C', null: false
# t.index 'ancestry'
