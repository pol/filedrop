class Drop
  include DataMapper::Resource
  include DataMapper::Validate
  include Paperclip::Resource
  
  property :id,          Serial
  property :uuid,        String
  property :name,        String
  property :description, Text
  
  property :created_at, DateTime
  property :created_on, Date
 
  property :updated_at, DateTime
  property :updated_on, Date
  
  belongs_to :user
  
  before :create, :generate_uuid
  before :create, :send_notification
  
  # TODO: The attachments will be lost after every cap deploy.
  has_attached_file :file,
                    :path => ":rails_root/public/paperclip/:attachment/:id/:basename.:extension",
                    :url  => ":rails_root/public/paperclip/:attachment/:id/:basename.:extension"
                    
  validates_attachment_presence :file

  def expiration_date
    (self.created_at || Time.now) + 5.days 
  end

  private
  
  def send_notification
    Notifier.deliver_new_drop_notification(self.user,self)
  end
  
  def generate_uuid # => 8 characters should be sufficient
    begin
      tmp_uuid = UUIDTools::UUID.timestamp_create.to_s.gsub(/\-/,'')[0..7]
    end until Drop.first(:uuid => tmp_uuid).nil? # => keep doing this until you have a new uuid
    self.uuid = tmp_uuid
  end
end

# class Drop < ActiveRecord::Base
#   belongs_to :user
#   
#   has_attached_file :file,
#                     :path => ":rails_root/public/paperclip/:attachment/:id/:basename.:extension",
#                     :url => ":rails_root/public/paperclip/:attachment/:id/:basename.:extension"
#   
#   validates_attachment_presence :file
#   validates_presence_of :user
#   
#   before_create :generate_uuid
#   after_create  :send_notification
#   
#   def expiration_date
#     (self.created_at || Time.now) + 5.days 
#   end
#     
#   private 
#   
#   def send_notification
#     Notifier.deliver_new_drop_notification(self.user,self)
#   end
#   
#   def generate_uuid # => 8 characters should be sufficient
#     begin
#       tmp_uuid = UUIDTools::UUID.timestamp_create.to_s.gsub(/\-/,'')[0..7]
#     end until Drop.find_by_uuid(tmp_uuid).nil? # => keep doing this until you have a new uuid
#     self.uuid = tmp_uuid
#   end  
# end
