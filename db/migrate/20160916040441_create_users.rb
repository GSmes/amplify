class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :access_token
      t.text :refresh_token
      t.integer :token_expiry
    end
  end
end
