class CreateFavRpts < ActiveRecord::Migration[5.1]
  def change
    create_table :fav_rpts do |t|
      t.integer :user_id
      t.integer :report_id
      t.timestamps
    end
  end
end
