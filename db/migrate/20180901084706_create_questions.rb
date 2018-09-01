class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
