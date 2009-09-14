require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Drop do
  # fixtures :users
  #  before(:each) do
  #    @valid_attributes = {
  #      :file => fixture_file_upload('files/sapphire.png', 'image/jpeg'),
  #      :uuid => '',
  #      :name => 'My file',
  #      :description => '',
  #      :user => users(:quentin)
  #    }
  #  end
  #  
  #  # We don't need to test file storage, paperclip has its own tests.
  #  it "should create a new instance given valid attributes" do
  #    lambda do
  #      d = create_drop(@valid_attributes)
  #    end.should change(Drop, :count).by(1)
  #  end
  #  
  #  it "should have an owner" do
  #    @valid_attributes.delete(:user)
  #    d = create_drop(@valid_attributes)
  #    d.errors.on(:user).should_not be_nil
  #  end
  #  
  #  it "should generate a uuid after being saved" do
  #    @valid_attributes[:uuid].should be_empty
  #    d = create_drop(@valid_attributes)
  #    d.uuid.should_not be_empty
  #  end
  #  
  #  it "should not change the UUID on update" do
  #    d = create_drop(@valid_attributes)
  #    uuid = d.uuid
  #    d.name = "New Name"
  #    d.save
  #    d.uuid.should == uuid
  #  end
  #  
  #  it "should have an expiration_date that is 5 days after the created_at date" do
  #    d = create_drop(@valid_attributes)
  #    d.expiration_date.should == d.created_at + 5.days
  #  end
  #  
  #  it "should delete all expired drops as per the rake task syntax" # do
  #  #     Drop.find(:all, :conditions => ["created_at < ?", 5.days.ago.to_s(:db)]).map(&:destroy)
  #  #   end
  #  
  #  it "should not delete unexpired drops with the rake task syntax" # do
  #  #     Drop.find(:all, :conditions => ["created_at < ?", 5.days.ago.to_s(:db)]).map(&:destroy)
  #  #   end
  #  
  #  protected
  #  # Idea for this method was ripped off from restful_auth specs
  #  def create_drop(options = {})
  #    record = Drop.new({}.merge(options))
  #    record.stub!(:save_attached_files).and_return true
  #    record.save
  #    record
  #  end
end
