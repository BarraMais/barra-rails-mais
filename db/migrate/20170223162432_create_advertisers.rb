class CreateAdvertisers < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisers do |t|
      t.string :name
      t.integer :document_type
      t.string :document_number
      t.string :email
      t.string :website
      t.string :facebook
      t.string :instagram

      t.timestamps
    end
  end
end
