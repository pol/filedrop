require 'authlogic'
class User
  include YogoAuthz::YogoUser
  
  has n, :drops
  
  def self.find_by_ldap_login(login)
    self.first(:conditions => {:login => login})
  end

  def self.create_with_ldap_data(login,password,user_data)
    _password = create_random_password
    user = self.create(:login       => login,
                :password    => _password, :password_confirmation => _password,
                :email       => "#{user_data[:mail][0]}",
                :first_name  => "#{user_data[:givenname][0]}",
                :last_name   => "#{user_data[:sn][0]}")
                
    return user            
  end
  
  private
  
  def self.create_random_password
    "--#{(rand()-0.5)*100090}--#{DateTime.now}--"
  end
  
end
