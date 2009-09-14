namespace :filedrop do
  desc "Delete expired files"
  task :prune => :environment do
    num = Drop.all.length
    Drop.all( :conditions => ["created_at < ?", 5.days.ago.to_s(:db)]).destroy
    puts "#{num - Drop.all.length} FileDrops Pruned."
  end
  
  desc "Send emails about expiring FileDrops"
  task :send_expiration_notifications => :environment do
    expiring_drops = Drop.find(:all, 
      :conditions => ["created_at BETWEEN ? AND ?", 4.days.ago.to_s(:db), 5.days.ago.to_s(:db)])
    expiring_drops.each do |drop|
      Notifier.deliver_expiring_drop_notification(drop.user,drop)
    end
    puts "#{expiring_drops.length} Expiring FileDrop Notifications Sent."
  end
  
end