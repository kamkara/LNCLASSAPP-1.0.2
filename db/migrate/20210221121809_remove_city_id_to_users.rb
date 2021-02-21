class RemoveCityIdToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :city_id
  end
end
