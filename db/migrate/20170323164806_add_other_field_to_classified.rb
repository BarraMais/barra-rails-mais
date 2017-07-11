class AddOtherFieldToClassified < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds, :document_number, :string
  end
end
