
User.destroy_all
Activity.destroy_all
%w(admin bob billy chris jeff).each do |username|
  User.create!(username: username,
             email: "#{username}@example.com",
             password: 'letsgo')
end
