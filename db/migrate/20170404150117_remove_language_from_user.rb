class RemoveLanguageFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :language, :string
  end
end
