# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, default: '', null: false, index: { unique: true }
      t.string :email, default: '', null: false, index: { unique: true }
      t.string :password_digest
      t.timestamps
    end
  end
end
