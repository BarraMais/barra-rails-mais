class CreateClassifieds < ActiveRecord::Migration[5.0]
  def change
    create_table :classifieds do |t|
      t.string :title
      t.integer :document_type
      t.string :seller_name
      t.string :email
      t.string :landline
      t.string :cell_phone
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
