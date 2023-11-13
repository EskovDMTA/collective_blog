# frozen_string_literal: true
class ChangeForeignKey < ActiveRecord::Migration[7.1]
  def change
    # remove_foreign_key :posts, :creators
    # add_foreign_key :posts, :users, column: :creator_id
  end
end
