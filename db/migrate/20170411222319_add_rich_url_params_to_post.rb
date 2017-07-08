class AddRichUrlParamsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :rich_url, :json
  end
end
