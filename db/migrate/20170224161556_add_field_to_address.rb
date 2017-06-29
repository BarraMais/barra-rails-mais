class AddFieldToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :advertiser, foreign_key: true
  end
end
