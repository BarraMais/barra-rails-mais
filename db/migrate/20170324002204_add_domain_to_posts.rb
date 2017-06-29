class AddDomainToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :domain, :integer, default: 0
    add_column :posts, :domain_id, :integer
  end
end
