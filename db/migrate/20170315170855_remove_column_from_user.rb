class RemoveColumnFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :naval_service, :string
  end
end
