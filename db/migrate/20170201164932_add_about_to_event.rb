class AddAboutToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :about, :text
  end
end
