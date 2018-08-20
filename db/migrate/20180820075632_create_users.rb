class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :icon_image
      t.timestamps
      t.index [:email], name: "index_users_on_email", unique: true
    end
  end
end
