class DropPhonesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :landlines
    drop_table :cell_phones
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
