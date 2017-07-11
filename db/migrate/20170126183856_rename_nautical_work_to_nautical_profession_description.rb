class RenameNauticalWorkToNauticalProfessionDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :nautical_work, :nautical_profession_description
  end
end
