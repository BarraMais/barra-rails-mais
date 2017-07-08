class RemoveAboutTextFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :about_text, :text
  end
end
