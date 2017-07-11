class AddFishingCategoryToFishing < ActiveRecord::Migration[5.0]
  def change
    add_reference :fishings, :fishing_category, foreign_key: true
  end
end
