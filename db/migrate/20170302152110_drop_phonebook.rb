class DropPhonebook < ActiveRecord::Migration[5.0]
  def up
    drop_table :phonebooks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
