class CreateDrops < ActiveRecord::Migration
  def self.up
    create_table :drops, :options => "ENGINE = MyISAM" do |t|
      t.integer     :user_id
      t.string      :uuid
      t.string      :name
      t.text        :description
      t.string      :file_file_name
      t.string      :file_content_type
      t.integer     :file_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :drops
  end
end
