class DeleteFavAns < ActiveRecord::Migration[5.1]
  def change
    drop_table :fav_ans
  end
end
