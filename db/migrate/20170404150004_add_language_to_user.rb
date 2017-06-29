class AddLanguageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :language, :string
    add_column :users, :mobile_operator, :string
    add_column :users, :alternative_email, :string
  end
end
