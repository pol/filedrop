require "#{RAILS_ROOT}/config/environment.rb"

namespace :users do
  desc "Generate Users"
  task :generate => :environment do
    opts = process_options
    if ENV['users'].nil?
      puts "Number of users not specified!"
      puts "Usage: rake users:generate users=[number] OPTIONS"
      puts "Example:  rake users:generate users=30"
      puts "-------------------------------------------------"
      puts "Options:"
      puts "password=[password] : choose a string as the user"
      puts "                      password."
      puts "domain=[domain] : choose a domain for each of the"
      puts "                  user email accounts."
      exit
    else
      num = User.count
      make_user(ENV['users'].to_i, opts)
      if User.count > num
        puts "#{User.count - num} users created."
      else
        puts "No users were created."
      end
    end
  end
end

def make_user(x, opts = {})
  x.times do
    fname, lname = generate_name, generate_name
    login = "#{fname}.#{lname}"
    email = "#{login}@#{opts[:domain]}"
    User.create(
      :login    => login,
      :email    => email,
      :name     => "#{fname} #{lname}",
      :password => opts[:password], :password_confirmation => opts[:password]
    )
  end
end

def process_options
  {
    :users    => ENV['users'],
    :password => ENV['password'] || 'password',
    :domain   => ENV['domain']   || 'somewhere.com'
  }
end

def generate_name()
  ["Abela","Aberahama","Aberama","Abesoloma","Abia","Abisai","Acantha",
   "Adamina","Adamu","Adara","Aditi","Adria","Aleta","Aminta","Amria",
   "Besnik", "Beti", "Blasia", "Boiko","Brishen","Calandra","Calypso",
   "Camlo","Casamir","Catarina","Cato","Chal","Chavali","Chavi","Chik",
   "Cosima","Czigany","Damara","Danior","Dooriya","Drabardi","Dudee",
   "Dukker", "Durriken", "Durril", "Electra","Esmerelda","Ferka","Fifika",
   "Flora","Florica","Garridan","Gillie","Gitana","Gypsy","Hanzi","Ilona",
   "Jal","Jibben", "Kali", "Kirvi", "Kizzy", "Lel","Lendar", "Lennor",
   "Lensar","Llesenia","Loiza","Malina", "Mander", "Manishie", "Marko",
   "Melantha", "Merripen", "Mestipen", "Mirela","Nadja","Natayla","Nicu", 
   "Olena","Oriana", "Pol","Pattin", "Pesha","Petsha", "Philana","Pias",
   "Pitivo","Pov","Pulika","Punka","Radu","Ramon","Rasia","Rawnie","Risa",
   "Rumer","Rye","Sadira","Sapphira","Shalaye","Shebari","Shey","Shofranka",
   "Shimza","Sirena","Stiggur","Syeira","Taletha","Tamas","Tas","Tawno",
   "Tem","Theron","Tobar","Tzigane","Vita","Wen","Wesh","Yanko","Yesenia",
   "Yoska","Zale","Zenda","Zenina","Zenobia","Zigana","Zindelo"][rand(123)]
 end