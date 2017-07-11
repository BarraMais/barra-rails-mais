class AddMoldToVessel < ActiveRecord::Migration[5.0]
  def change
    add_reference :vessels, :mold, foreign_key: true
  end
end
