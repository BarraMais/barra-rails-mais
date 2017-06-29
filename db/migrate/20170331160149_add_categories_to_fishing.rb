class AddCategoriesToFishing < ActiveRecord::Migration[5.0]
  def change
    add_reference :fishings, :fishing_sub_category, foreign_key: true
  end
end
