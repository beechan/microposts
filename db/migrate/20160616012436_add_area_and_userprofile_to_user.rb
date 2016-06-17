class AddAreaAndUserprofileToUser < ActiveRecord::Migration
  def change
    add_column :users, :area, :string
    add_column :users, :user_profile, :string
  end
end
