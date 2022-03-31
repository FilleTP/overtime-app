@user = User.create(email: "newmeail@cool.com", password: "12345671", password_confirmation: "12345671", first_name: "Peter", last_name: "Andersson")
puts "1 user created"
100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 posts has been created"
