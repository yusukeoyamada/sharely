class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :tag_name
      t.boolean :permission_flag
      t.string :image
      t.timestamps
    end
  end
end
