class RemovePermissionFlagAndTagNameFromReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :permission_flag
    remove_column :reports, :tag_name
  end
end
