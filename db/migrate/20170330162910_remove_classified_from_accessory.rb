class RemoveClassifiedFromAccessory < ActiveRecord::Migration[5.0]
  def change
    remove_reference :accessories, :classified, foreign_key: true
  end
end
