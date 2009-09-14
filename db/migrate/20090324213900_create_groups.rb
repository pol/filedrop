class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string  :name
      t.string  :description
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
    g = Group.create(:name => "sysadmin", 
                     :description => "User group with full administrator priviliges.")
    User.create(:login                 => "sysadmin", 
                :name                  => "System Administrator",
                :email                 => "acg-support@montana.edu",
                :password              => "password",
                :password_confirmation => "password")
  end

  def self.down
    drop_table :groups
  end
end
