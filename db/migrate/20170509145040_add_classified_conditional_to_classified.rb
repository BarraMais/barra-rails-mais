class AddClassifiedConditionalToClassified < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds, :classified_conditional, :integer
  end
end
