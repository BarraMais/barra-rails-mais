class AddAnotherFieldToClassified < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds, :bonded, :boolean
  end
end
