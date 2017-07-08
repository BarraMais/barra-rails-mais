class AddFieldToClassified < ActiveRecord::Migration[5.0]
  def change
    add_reference :classifieds, :user, foreign_key: true
  end
end
