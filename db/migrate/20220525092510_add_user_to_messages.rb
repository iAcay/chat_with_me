# frozen_string_literal: true

class AddUserToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :user, null: false, foreign_key: { to_table: :users }
  end
end
