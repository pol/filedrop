class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
    u = User.find_by_login("sysadmin")
    u.groups << Group.find_by_name("sysadmin")
    u.save
  end

  def self.down
    drop_table :memberships
  end
end
