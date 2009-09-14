class Notifier < ActionMailer::Base

  def new_drop_notification(user, drop)
     recipients user.email
     from       "no-reply@filedrop.msu.montana.edu"
     subject    "New Filedrop Added: #{drop.name.blank? ? drop.file_file_name : drop.name}"
     body       :user => user, :drop => drop
  end
  
  def expiring_drop_notification(user, drop)
    recipients user.email
    from       "no-reply@filedrop.msu.montana.edu"
    subject    "Filedrop Expiration Notice: #{drop.name.blank? ? drop.file_file_name : drop.name}"
    body        :user => user, :drop => drop
  end

end
