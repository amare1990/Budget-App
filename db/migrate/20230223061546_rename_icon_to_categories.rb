class RenameIconToCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :icon, :image_data
  end
end
