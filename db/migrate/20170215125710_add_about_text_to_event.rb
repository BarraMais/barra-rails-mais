class AddAboutTextToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :about_text, :text
  end
end
