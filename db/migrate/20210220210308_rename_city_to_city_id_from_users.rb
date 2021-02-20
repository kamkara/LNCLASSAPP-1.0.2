class RenameCityToCityIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city_id, :uuid
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
