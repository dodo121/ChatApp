(1..5).each do
  testing_login_password = FFaker::Lorem.characters[0..6]
  User.create!(email: FFaker::Internet.safe_email,
               login: testing_login_password,
               password: testing_login_password,
               for_testing: true)
end

User.all.each_cons(2) do |users|
  conversation = Conversation.create
  conversation.users << users
  Message.create!(content: FFaker::Lorem.sentence, conversation: conversation, sender: users.first)
  Message.create!(content: FFaker::Lorem.sentence, conversation: conversation, sender: users.last)
end