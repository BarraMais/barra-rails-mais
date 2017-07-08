class AddProvisionalCategoryToFishing < ActiveRecord::Migration[5.0]
  def change
    add_column :fishings, :provisional_category, :string
  end
end
