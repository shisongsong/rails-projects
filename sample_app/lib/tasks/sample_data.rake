namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "aaaaaa"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: false)
    end
  end

  desc "add a admin user"
  task add_admin: :environment do
    User.create!(name: "管理员",
                 email: "shi1400875096@outlook.com",
                 password: "Xinxin1hao",
                 password_confirmation: "Xinxin1hao",
                 admin: true)
  end

  desc "add microposts"
  task add_microposts: :environment do
    Micropost.create!(user_id: 1,content: "aaa") 
  end

  desc "add microposts"
  task add_relationships: :environment do
      users = User.all
      user = users.first
      followed_users = users[2..50]
      followers = users[3..40]
      followed_users.each { |followed| user.follow!(followed) } 
      followers.each { |follower| follower.follow!(user) }
  end
end
