#namespace :db do
#  desc "Fill database with sample data"
#  task :populate => :environment do
#    Rake::Task['db:reset'].invoke
#
#    99.times do |n|
#      name      = Faker::Name.name
#      email     = "example-#{n+1}@examplepopulate.com"
#      password  = "password"
#      User.create!( :name                   => name,
#                    :email                  => email,
#                    :password               => password,
#                    :password_confirmation  => password)
#    end
#  end
#end

namespace :db do
  desc "Fill database with sample data"

  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    99.times do |n|
      name      = Faker::Name.name
      email     = "example-#{n+1}@examplepopulate.com"
      password  = "password"
      User.create!( :name                   => name,
                    :email                  => email,
                    :password               => password,
                    :password_confirmation  => password)
    end

    users = User.all(:limit => 6)
    50.times do
      name = "Cerro"
      description = Faker::Lorem.sentence(5)
      date = "/04/13"
      estado = 1
      users.each { |user| user.events.create!(:name => name, :description => description,
                                              :date => date, :estado => estado) }
    end
  end
end
